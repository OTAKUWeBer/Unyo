// External dependencies
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelfio;
import 'package:unyo/core/services/api/dto/api_dtos.dart';
import 'package:unyo/core/services/api/http/api_response.dart';
import 'package:unyo/core/services/api/http/http_service.dart';
import 'package:url_launcher/url_launcher.dart';

// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/domain/repositories/repositories.dart';
import 'package:unyo/domain/entities/user.dart';

class UserRepositoryAnilist implements UserRepository {
  final Logger _logger = sl<Logger>();
  final HttpService _httpService = sl<HttpService>();
  late Box<User> _anilistUsersBox;
  late HttpServer _server;

  @override
  Future<List<User>> fetchAllLoggedInUsers() async {
    return [];
  }

  @override
  Future<void> createUser() async {
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
      _handleAccessCode(accessCode);
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

  Future<void> _handleAccessCode(String accessCode) async {
    // _anilistUsersBox = await Hive.openBox<User>("anilistUsers");
    Map<String, dynamic> body = {
      "grant_type": "authorization_code",
      "client_id": 17550,
      "client_secret": "xI8KTZlKm2F3kHXLko1ArQ21bKap4MojgDTk6Ukx",
      "redirect_uri": "http://localhost:9999/auth",
      "code": accessCode,
    };
    ApiResponse<AuthTokenDto> authToken = await _httpService.post<AuthTokenDto>(config.anilistOAuthEndpoint, fromJson: AuthTokenDto.fromJson, body: body);
    _logger.d("${authToken.data.accessToken} ${authToken.data.refreshToken}");
  }
}
