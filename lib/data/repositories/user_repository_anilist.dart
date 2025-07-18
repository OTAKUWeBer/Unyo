// External dependencies
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelfio;
import 'package:unyo/core/services/api/graphql/graphql_exception.dart';
//Internal dependencies
import 'package:unyo/core/services/api/graphql/queries/queries.dart' as queries;
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/core/services/api/dto/api_dtos.dart';
import 'package:unyo/core/services/api/dto/viewer_graphql_dto_entity.dart';
import 'package:unyo/core/services/api/graphql/graphql_response.dart';
import 'package:unyo/core/services/api/graphql/graphql_service.dart';
import 'package:unyo/core/services/api/http/api_response.dart';
import 'package:unyo/core/services/api/http/http_service.dart';
import 'package:unyo/data/models/anilist_user_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:unyo/domain/repositories/repositories.dart';
import 'package:unyo/domain/entities/user.dart';

class UserRepositoryAnilist implements UserRepository {
  final Logger _logger = sl<Logger>();
  final HttpService _httpService = sl<HttpService>();
  final GraphQLService _anilistGraphQLService = sl<GraphQLService>(instanceName: config.anilistGraphQlService);
  late Box<User> _anilistUsersBox;
  late HttpServer _server;

  @override
  Future<List<User>> fetchAllLoggedInUsers() async {
    _anilistUsersBox = await Hive.openBox<AnilistUserModel>("anilistUsers");
    return [..._anilistUsersBox.values.toSet()];
  }

  Future<ApiResponse<AuthTokenDto>> getAuthToken(String accessCode) async {
    Map<String, dynamic> body = {
      "grant_type": "authorization_code",
      "client_id": config.anilistClientId,
      "client_secret": config.anilistClientSecret,
      "redirect_uri": config.anilistRedirectUri,
      "code": accessCode,
    };
    return _httpService.post<AuthTokenDto>(config.anilistOAuthEndpoint, fromJson: AuthTokenDto.fromJson, body: body);
  }

  @override
  Future<void> attemptCreateUser() async {
    _logger.i("Creating Anilist user");
    try {
      _logger.d("Opening Anilist login server at http://localhost:9999");
      _server = await shelfio.serve(_handleLoginRequest, 'localhost', 9999);
    } catch (e, stackTrace) {
      _logger.e("Error attempting to open server: $e", stackTrace: stackTrace);
    }

    _logger.i("Launching Anilist authorization URL: ${config.anilistAuthUrl}");
    if (await canLaunchUrl(Uri.parse(config.anilistAuthUrl))) {
      await launchUrl(Uri.parse(config.anilistAuthUrl));
    } else {
      _logger.e("Could not launch ${config.anilistAuthUrl}");
    }
  }

  Future<shelf.Response> _handleLoginRequest(shelf.Request request) async {
    try {
      _logger.i("Handling login request from Anilist at ${request.requestedUri.path}");
      String accessCode = request.requestedUri.queryParameters['code']!;
      await _createUser(accessCode);
      return shelf.Response.ok(
        'Authorization successful. You can close this window.',
      );
    } catch (e, stackTrace) {
      _logger.e("Error Handling login request: $e", stackTrace: stackTrace);
      return shelf.Response.internalServerError(
        body:
            "Something went wrong D:, please verify your internet connection and try again",
      );
    } finally {
      _logger.i("Closing Anilist login server");
      _server.close();
    }
  }

  Future<void> _createUser(String accessCode) async {
    _anilistUsersBox = await Hive.openBox<AnilistUserModel>("anilistUsers");
    ApiResponse<AuthTokenDto> authToken = await getAuthToken(accessCode);
    Map<String, String> graphQlHeaders = {"Authorization": "Bearer ${authToken.data.accessToken}"};
    ApiGraphQLResponse<ViewerGraphqlDtoEntity> viewerDto =
      await _anilistGraphQLService.query<ViewerGraphqlDtoEntity>(
          query: queries.viewerQuery,
          fromJson: ViewerGraphqlDtoEntity.fromJson,
          headers: graphQlHeaders
      );
    _throwIfGraphQlError(viewerDto);
    AnilistUserModel newAnilistUser = AnilistUserModel(
        name: viewerDto.data.viewer.name,
        avatarImage: viewerDto.data.viewer.avatar.medium,
        accessCode: accessCode,
        accessToken: authToken.data.accessToken,
        refreshToken: authToken.data.refreshToken
    );
    _anilistUsersBox.put(viewerDto.data.viewer.name, newAnilistUser);
  }

  void _throwIfGraphQlError<T>(ApiGraphQLResponse<T> graphQlResponse) {
    if (graphQlResponse.errors != null && graphQlResponse.errors!.isNotEmpty) {
      throw GraphQLException(graphQlResponse.errors!);
    }
  }
}
