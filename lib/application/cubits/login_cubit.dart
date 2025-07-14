// External dependencies
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/states/login_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/login_card_type.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/data/models/models.dart';
import 'package:unyo/data/repositories/repositories.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/user.dart';
import 'package:unyo/presentation/dialogs/account_creation_dialog.dart';

class LoginCubit extends Cubit<LoginState> with EffectMixin<LoginState> {
  // Repositories
  final UserRepositoryHive _userRepository;
  final Logger _logger = sl<Logger>();

  // Notifiers / Subscriptions
  final UserNotifier _userNotifier;

  LoginCubit(this._userRepository, this._userNotifier)
    : super(
        LoginState(
          user: UserModel.empty(),
          availableUsers: [],
          selectedLoginCard: LoginCardType.anilist,
        ),
      );

  @override
  LoginState copyStateWithEffects(LoginState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  Future<void> initiateAccountCreation(BuildContext context) async {
    showWidgetDialogEffect(dialog: AccountCreationDialog(context));
  }

  Future<void> fetchAllUsers() async {
    List<User> usersAvailable =
        (await _userRepository.fetchAllUsers()).cast<User>();
    updateAvailableUsers(usersAvailable);
  }

  void updateAvailableUsers(List<User> users) {
    emit(state.copyWith(availableUsers: users));
  }
}
