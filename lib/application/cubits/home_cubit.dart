// Dart dependencies
import 'dart:async';

// External dependencies
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/states/home_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/core/notification/menu_bar_notifier.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/data/models/anilist_user_model.dart';
import 'package:unyo/data/models/local_user_model.dart';
import 'package:unyo/data/repositories/repositories.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/user.dart';

class HomeCubit extends Cubit<HomeState> with EffectMixin<HomeState> {
  // Repositories
  final UserRepositoryAnilist _userRepositoryAnilist;

  // Notifiers / Subscriptions
  final UserNotifier _loggedUserNotifier;
  final MenuBarNotifier _menuBarNotifier;
  late StreamSubscription<User> _newLoggedUserSubscription;
  final Logger _logger = sl<Logger>();

  HomeCubit(
    this._loggedUserNotifier,
    this._userRepositoryAnilist,
    this._menuBarNotifier,
  ) : super(
        HomeState(
          loggedUser: UserModel.empty(),
          selectedMenuOption: SelectedMenuOption.home,
          continueWatching: [],
          continueReading: [],
          isLoading: true,
        ),
      ) {
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

  void _init() {
    _newLoggedUserSubscription = _loggedUserNotifier.userStream.listen((
      user,
    ) async {
      await _getUserInfo(user);
      _menuBarNotifier.showMenuBar(true);
      emit(
        state.copyWith(loggedUser: user, isLoading: false),
      ); // Update state on new data
    });
  }

  void selectMenuOption(SelectedMenuOption option) {
    emit(state.copyWith(selectedMenuOption: option));
  }

  void navigateToAnimeDetails(Anime anime) {
    _logger.i("Navigating to Anime Details of ${anime.title}");
    pushRouteEffect(path: "/animedetails");
  }

  void navigateToUserAnimeList(BuildContext context) {
    _logger.i("Navigating to User Anime List");
    pushRouteEffect(path: "/userlist?type=anime");
  }

  void navigateToUserMangaList(BuildContext context) {
    _logger.i("Navigating to User Manga List");
    pushRouteEffect(path: "/userlist?type=manga");
  }

  Future<void> _getUserInfo(User user) async {
    try {
      switch (user) {
        case AnilistUserModel anilistUserModel:
          _logger.i("Fetching Anilist User lists");
          List<Anime> watchingList = await _userRepositoryAnilist
              .getUserWatchingList(user);
          List<Manga> readingList = await _userRepositoryAnilist
              .getUserReadingList(user);
          emit(
            state.copyWith(
              continueWatching: watchingList,
              continueReading: readingList,
            ),
          );
        case LocalUserModel localUserModel:
      }
    } catch (e, stackTrace) {
      handleError("Error fetching user info: $e", stackTrace: stackTrace);
      replaceRouteEffect(path: "/login");
    }
  }

}
