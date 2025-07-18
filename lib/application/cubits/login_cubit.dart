// External dependencies
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/states/login_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/login_card_type.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/core/services/api/dto/api_dtos.dart';
import 'package:unyo/core/services/api/http/api_response.dart';
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

 Future<void> loginUser(User user) async {
   switch(user) {
     case AnilistUserModel anilistUserModel:
        _logger.i("Logging in Anilist User: ${anilistUserModel.name}");
        await _loginAnilistUser(anilistUserModel);
     case LocalUserModel localUserModel:
       _logger.i("Logging in Local User: ${localUserModel.name}");
     default:
        _logger.w("Unsupported user type for login: ${user.runtimeType}");
        showSnackBarEffect(
          "Login Error",
          message: "Unsupported user type for login",
          contentType: ContentType.failure,
        );
   }
   replaceRouteEffect(path: "/home");
 }

  Future<void> attemptToCreateUser(BuildContext context) async {
    switch (state.selectedLoginCard) {
      case LoginCardType.anilist:
        _logger.i("Attempting to create Anilist User");
        await _createUser();
      case LoginCardType.mal:
        _logger.i("Attempting to create MyAnimeList User");
      case LoginCardType.local:
        _logger.i("Attempting to create Local User");
    }
    if (context.mounted) closeDialogEffect(context);
    await fetchAllUsers();
  }

  Future<void> _createUser() async{
    try{
      await _userRepositoryAnilist.attemptCreateUser();
    }catch (e, stackTrace) {
     _logger.e("Error creating user $e", stackTrace: stackTrace);
     showSnackBarEffect("Something went wrong", message: "Error creating user", contentType: ContentType.failure);
    }
  }

  Future<void> fetchAllUsers() async {
    _logger.i("Fetching all logged in users");
    List<User> usersAvailableLocal =
        (await _userRepositoryLocal.fetchAllLoggedInUsers()).cast<User>();
    List<User> usersAvailableAnilist =
    (await _userRepositoryAnilist.fetchAllLoggedInUsers()).cast<User>();
    _updateAvailableUsers(usersAvailableAnilist + usersAvailableLocal);
  }

  void _updateAvailableUsers(List<User> users) {
    emit(state.copyWith(availableUsers: users));
  }

  Future<void> _loginAnilistUser(User user) async {
    DateTime dateTime = JwtDecoder.getExpirationDate(user.accessToken);
    if (dateTime.isBefore(DateTime.now())) {
      _logger.w("Anilist User token is expired, getting new accessToken");
      try {
        ApiResponse<AuthTokenDto> authToken = await _userRepositoryAnilist.getAuthToken(user.accessCode);
        User updatedUser = (user as AnilistUserModel).copyWith(accessToken: authToken.data.accessToken, refreshToken: authToken.data.refreshToken);
        _userNotifier.updateUser(updatedUser);
        return;
      } catch (e, stackTrace) {
        _logger.e("Error refreshing user token: $e", stackTrace: stackTrace);
        showSnackBarEffect(
          "Something went wrong",
          message: "Error refreshing user expired token",
          contentType: ContentType.failure,
        );
        return;
      }
    }
    _userNotifier.updateUser(user);
  }
}
