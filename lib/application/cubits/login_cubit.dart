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
  final UserRepositoryLocal _userRepositoryLocal;
  final UserRepositoryAnilist _userRepositoryAnilist;
  final Logger _logger = sl<Logger>();

  // Notifiers / Subscriptions
  final UserNotifier _userNotifier;

  LoginCubit(this._userRepositoryLocal, this._userNotifier, this._userRepositoryAnilist)
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

  void initiateAccountCreation(BuildContext context) async {
    showWidgetDialogEffect(dialog: AccountCreationDialog(context));
  }

  void selectLoginType(LoginCardType type) async {
    if (state.selectedLoginCard == type) return;
    _logger.d("Login type selected: $type");
    emit(state.copyWith(selectedLoginCard: type));
  }

  void closeAccountCreationDialog(BuildContext context) {
    _logger.d("Closing account creation dialog");
    closeDialogEffect(context);
  }

  Future<void> attemptToCreateUser(BuildContext context) async {
    switch (state.selectedLoginCard) {
      case LoginCardType.anilist:
        _logger.i("Attempting to create Anilist User");
        _userRepositoryAnilist.createUser();
        break;
      case LoginCardType.mal:
        _logger.i("Attempting to create MyAnimeList User");
        break;
      case LoginCardType.local:
        _logger.i("Attempting to create Local User");
        break;
    }
    closeDialogEffect(context);
  }

  Future<void> fetchAllUsers() async {
    List<User> usersAvailableLocal =
        (await _userRepositoryLocal.fetchAllLoggedInUsers()).cast<User>();
    List<User> usersAvailableAnilist =
    (await _userRepositoryAnilist.fetchAllLoggedInUsers()).cast<User>();
    updateAvailableUsers(usersAvailableAnilist + usersAvailableLocal);
  }

  void updateAvailableUsers(List<User> users) {
    emit(state.copyWith(availableUsers: users));
  }
}
