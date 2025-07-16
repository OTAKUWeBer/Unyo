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
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/data/models/models.dart';
import 'package:unyo/data/repositories/repositories.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/user.dart';

class HomeCubit extends Cubit<HomeState> with EffectMixin<HomeState> {
  //Repositories
  final UserRepositoryLocal _userRepository;

  // Notifiers / Subscriptions
  final UserNotifier _userNotifier;
  late StreamSubscription<User> _userSubscription;

  final Logger _logger = sl<Logger>();

  HomeCubit(
    this._userRepository,
    this._userNotifier,
  ) : super(HomeState(user: UserModel.empty())) {
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
    _userSubscription.cancel();
    return super.close();
  }

  void _init() {
    _userSubscription = _userNotifier.userStream.listen((user) {
      emit(state.copyWith(user: user)); // Update state on new data
    });
  }
}
