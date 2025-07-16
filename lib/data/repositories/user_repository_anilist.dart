// External dependencies
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelfio;
import 'package:url_launcher/url_launcher.dart';

// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/domain/repositories/repositories.dart';
import 'package:unyo/domain/entities/user.dart';

class UserRepositoryAnilist implements UserRepository {
  final Logger _logger = sl<Logger>();
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
}
