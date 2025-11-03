import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/manga_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/service.dart';
import 'package:unyo/core/notification/manga_genres_notifier.dart';
import 'package:unyo/core/notification/manga_notifier.dart';
import 'package:unyo/core/notification/media_list_notifier.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/data/repositories/manga_repository_anilist.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/media_list.dart';
import 'package:unyo/domain/entities/user.dart';
import 'effect_mixin.dart';

class MangaCubit extends Cubit<MangaState> with EffectMixin<MangaState> {
  final MangaRepositoryAnilist _mangaRepositoryAnilist;
  final UserNotifier _loggedUserNotifier;
  final MangaNotifier _selectedMangaNotifier;
  final MangaGenresNotifier _selectedMangaAdvancedSearchGenresFilters;
  final MediaListNotifier _selectedMediaListNotifier;
  late StreamSubscription<User> _loggedUserSubscription;
  final Logger _logger = sl<Logger>();

  MangaCubit(this._mangaRepositoryAnilist, this._loggedUserNotifier, this._selectedMangaNotifier, this._selectedMangaAdvancedSearchGenresFilters, this._selectedMediaListNotifier)
    : super(
        MangaState(
          trending: (false, []),
          popular: (false, []),
          recentlyCompleted: (false, []),
          upcoming: (false, []),
          banners: [],
          loggedUser: UserModel.empty(),
          isLoading: true,
          userLoaded: false,
        ),
      ) {
    _init();
  }

  @override
  MangaState copyStateWithEffects(MangaState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Future<void> close() {
    _loggedUserSubscription.cancel();
    return super.close();
  }

  @override
  Logger get logger => _logger;

  // TODO develop some loading states for the widgets and remove the awaits to make the load look faster
  void _init() async {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((
      loggedUser,
    ) async {
      emit(state.copyWith(loggedUser: loggedUser));
      if (!state.userLoaded) {
        await _fetchTrending(1, loggedUser);
        await _fetchRecentlyCompleted(1, loggedUser);
        await _fetchPopular(1, loggedUser);
        await _fetchUpcoming(1, loggedUser);
        emit(state.copyWith(userLoaded: true, isLoading: false));
      }
    });
  }

  void navigateToAdvancedSearch(BuildContext context) {
    _logger.i("Navigating to Manga Advanced Search");
    _selectedMangaAdvancedSearchGenresFilters.updateSelectedMangaGenre("");
    pushRouteEffect(path: "/mangasearch");
  }

  void navigateToMangaDetails(Manga manga, MediaList mediaList) {
    _logger.i("Navigating to Anime Details of ${manga.title.userPreferred}");
    _selectedMangaNotifier.updateSelectedManga(manga);
    _selectedMediaListNotifier.updateSelectedMediaList(mediaList);
    pushRouteEffect(path: "/mangadetails");
  }

  Future<void> _fetchTrending(int page, User loggedUser) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist trending manga");
          (bool, List<Manga>) trending = await _mangaRepositoryAnilist
              .getTrendingMangas(page, loggedUser);
          emit(state.copyWith(trending: trending));
          if (page == 1) {
            emit(
              state.copyWith(
                banners:
                    trending.$2
                        .where((manga) => manga.bannerImage != "")
                        .toList(),
              ),
            );
          }
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError("Failed to fetch trending manga $e", stackTrace: stackTrace);
    }
  }

  Future<void> _fetchPopular(int page, User loggedUser) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist popular manga");
          (bool, List<Manga>) popular = await _mangaRepositoryAnilist
              .getPopularMangas(page, loggedUser);
          emit(state.copyWith(popular: popular));
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError("Failed to fetch popular manga $e", stackTrace: stackTrace);
    }
  }

  Future<void> _fetchRecentlyCompleted(int page, User loggedUser) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist recently completed manga");
          (bool, List<Manga>) recentlyCompleted = await _mangaRepositoryAnilist
              .getRecentlyCompletedMangas(page, loggedUser);
          emit(state.copyWith(recentlyCompleted: recentlyCompleted));
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError(
        "Failed to fetch recently completed manga $e",
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _fetchUpcoming(int page, User loggedUser) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist upcoming manga");
          (bool, List<Manga>) upcoming = await _mangaRepositoryAnilist
              .getUpcomingMangas(page, loggedUser);
          emit(state.copyWith(upcoming: upcoming));
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError("Failed to fetch upcoming manga $e", stackTrace: stackTrace);
    }
  }
}
