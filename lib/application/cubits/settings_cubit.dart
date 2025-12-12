import 'dart:async';

import 'package:logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/settings_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/data/models/anilist_user_model.dart';
import 'package:unyo/data/models/local_user_model.dart';
import 'package:unyo/data/repositories/repositories.dart';
import 'package:unyo/domain/entities/settings.dart';
import 'package:unyo/domain/entities/user.dart';

class SettingsCubit extends Cubit<SettingsState> with EffectMixin<SettingsState> {
  final Logger _logger = sl<Logger>();
  final UserRepositoryAnilist _userRepositoryAnilist;
  final UserRepositoryLocal _userRepositoryLocal;
  final UserNotifier _loggedUserNotifier;
  late StreamSubscription<User> _loggedUserSubscription;

  SettingsCubit(this._userRepositoryAnilist, this._userRepositoryLocal, this._loggedUserNotifier)
    : super(SettingsState(loggedUser: UserModel.empty())) {
    _init();
  }

  @override
  SettingsState copyStateWithEffects(SettingsState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Future<void> close() {
    _loggedUserSubscription.cancel();
    return super.close();
  }

  @override
  Logger get logger => _logger;

  void _init() async {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((loggedUser) async {
      emit(state.copyWith(loggedUser: loggedUser));
    });
  }

  Future<void> enableNSFWContent(bool enable) async {
    try {
      Settings updatedSettings = (state.loggedUser.settings as SettingsModel).copyWith(enableNsfwContent: enable);
      _updateUserInfo(updatedSettings);
    } catch (e, stackTrace) {
      logger.e("Error enabling/disabling NSFW content $e", stackTrace: stackTrace);
      handleError("Error enabling/disabling NSFW content", stackTrace: stackTrace);
    }
  }

  Future<void> _updateUserInfo(Settings settings) async {
    try {
      switch (state.loggedUser) {
        case AnilistUserModel anilistUserModel:
          AnilistUserModel updatedAnilistUserModel = anilistUserModel.copyWith(settings: settings);
          await _userRepositoryAnilist.updateUserInfo(updatedAnilistUserModel);
          break;
        case LocalUserModel localUserModel:
          LocalUserModel updatedLocalUserModel = localUserModel.copyWith(settings: settings);
          await _userRepositoryLocal.updateUserInfo(updatedLocalUserModel);
          break;
      }
    } catch (e, stackTrace) {
      logger.e("Error updating user info $e", stackTrace: stackTrace);
      handleError("Error updating user info", stackTrace: stackTrace);
    }
  }
}
