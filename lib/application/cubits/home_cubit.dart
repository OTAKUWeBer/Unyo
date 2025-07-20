// Dart dependencies
import 'dart:async';

// External dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/states/home_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/data/models/models.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/user.dart';

class HomeCubit extends Cubit<HomeState> with EffectMixin<HomeState> {
  //Repositories

  // Notifiers / Subscriptions
  final UserNotifier _loggedUserNotifier;
  late StreamSubscription<User> _newLoggedUserSubscription;

  final Logger _logger = sl<Logger>();

  HomeCubit(
    this._loggedUserNotifier,
  ) : super(HomeState(loggedUser: UserModel.empty(), selectedMenuOption: SelectedMenuOption.home, continueWatching: [], continueReading: [])) {
    _init();
  }

  @override
  HomeState copyStateWithEffects(HomeState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  @override
  Future<void> close() {
    _newLoggedUserSubscription.cancel();
    return super.close();
  }

  void selectMenuOption(SelectedMenuOption option) {
    emit(state.copyWith(selectedMenuOption: option));
  }

  void _init() {
    _newLoggedUserSubscription = _loggedUserNotifier.userStream.listen((user) {
      emit(state.copyWith(loggedUser: user)); // Update state on new data
    });
  }
}
