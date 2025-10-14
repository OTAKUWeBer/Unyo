import 'dart:async';

import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/extensions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/core/services/api/http/http_exception.dart';
import 'package:unyo/domain/entities/extension.dart';
import 'package:unyo/domain/entities/user.dart';
import 'package:unyo/domain/repositories/extension_repository.dart';

class ExtensionsCubit extends Cubit<ExtensionsState> with EffectMixin<ExtensionsState> {
  final Logger _logger = sl<Logger>();

  // Repositories
  final ExtensionRepository _extensionRepositoryAniyomi;

  // Notifiers
  final UserNotifier _loggedUserNotifier;
  late StreamSubscription<User> _loggedUserSubscription;

  ExtensionsCubit(this._extensionRepositoryAniyomi, this._loggedUserNotifier)
    : super(
        ExtensionsState(
          loggedUser: UserModel.empty(),
          installedAnimeExtensions: [],
          installedMangaExtensions: [],
          availableAnimeExtensions: [],
          availableMangaExtensions: [],
        ),
      ) {
    _init();
  }

  @override
  ExtensionsState copyStateWithEffects(ExtensionsState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  @override
  Future<void> close() {
    _loggedUserSubscription.cancel();
    return super.close();
  }

  void _init() {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((loggedUser) {
      _fetchAvailableAnimeExtensions(loggedUser);
      _fetchAvailableMangaExtensions(loggedUser);
      emit(state.copyWith(
          loggedUser: loggedUser
      ));
    });
  }

  Future<void> _fetchAvailableAnimeExtensions(User loggedUser) async {
    try {
      _logger.i("Fetching available anime extensions for Aniyomi");
      Set<Extension> availableAniyomiExtensions = await _extensionRepositoryAniyomi
          .getAvailableAnimeExtensions(loggedUser);
      emit(state.copyWith(
          availableAnimeExtensions: availableAniyomiExtensions.toList()
      ));
    } on HttpServerException catch (e, stackTrace) {
      handleError(
        "Failed to fetch available anime extensions:",
        responseBody: e.message,
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      handleError("Failed to fetch available anime extensions $e", stackTrace: stackTrace);
    }
  }

  Future<void> _fetchAvailableMangaExtensions(User loggedUser) async {
    try {
      _logger.i("Fetching available manga extensions for Aniyomi");
      Set<Extension> availableTachiyomiExtensions = await _extensionRepositoryAniyomi
          .getAvailableMangaExtensions(loggedUser);
      emit(state.copyWith(
          availableMangaExtensions: availableTachiyomiExtensions.toList()
      ));
    } on HttpServerException catch (e, stackTrace) {
      handleError(
        "Failed to fetch available manga extensions:",
        responseBody: e.message,
        stackTrace: stackTrace,
      );
    } catch (e, stackTrace) {
      handleError("Failed to fetch available manga extensions $e", stackTrace: stackTrace);
    }
  }

}
