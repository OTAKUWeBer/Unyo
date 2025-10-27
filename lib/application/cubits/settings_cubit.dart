import 'dart:async';

import 'package:logger/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/settings_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/data/repositories/repositories.dart';
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
}
