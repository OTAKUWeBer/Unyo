import 'dart:async';

import 'package:auto_route/auto_route.dart' show AutoRouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/manga_advanced_search_state.dart';
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

class MangaAdvancedSearchCubit extends Cubit<MangaAdvancedSearchState>
    with EffectMixin<MangaAdvancedSearchState> {
  final Logger _logger = sl<Logger>();

  // Notifiers
  final UserNotifier _loggedUserNotifier;
  final MangaNotifier _selectedMangaNotifier;
  final MangaGenresNotifier _selectedMangaAdvancedSearchGenresFilters;
  final MediaListNotifier _selectedMediaListNotifier;
  late final StreamSubscription<User> _loggedUserSubscription;
  late final StreamSubscription<String> _selectedMangaAdvancedSearchGenresFiltersSubscription;

  // Repositories
  final MangaRepositoryAnilist _mangaRepositoryAnilist;

  MangaAdvancedSearchCubit(
    this._loggedUserNotifier,
    this._selectedMediaListNotifier,
    this._selectedMangaNotifier,
    this._selectedMangaAdvancedSearchGenresFilters,
    this._mangaRepositoryAnilist,
  ) : super(MangaAdvancedSearchState(loggedUser: UserModel.empty())) {
    _init();
  }

  @override
  MangaAdvancedSearchState copyStateWithEffects(MangaAdvancedSearchState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Future<void> close() {
    _loggedUserSubscription.cancel();
    _selectedMangaAdvancedSearchGenresFiltersSubscription.cancel();
    return super.close();
  }

  @override
  Logger get logger => _logger;

  void _init() async {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((loggedUser) {
      emit(state.copyWith(loggedUser: loggedUser));
      _getLoggedUserServiceFilters(loggedUser);
      _performMangaAdvancedSearch();
    });
    _selectedMangaAdvancedSearchGenresFiltersSubscription = _selectedMangaAdvancedSearchGenresFilters
        .mangaGenreStream
        .listen((newMangaGenre) {
          if (newMangaGenre == "") return;
          updateGenres([newMangaGenre]);
        });
  }

  void navigateToMangaDetails(BuildContext context, Manga manga, MediaList mediaList) {
    _logger.i("Navigating to Manga Details of ${manga.title}");
    _selectedMangaNotifier.updateSelectedManga(manga);
    _selectedMediaListNotifier.updateSelectedMediaList(mediaList);
    bool hasMangaDetailsInStack = AutoRouter.of(context).stackData.any(
          (route) => route.name == "MangaDetailsRoute",
    );
    if (hasMangaDetailsInStack) {
      popRouteEffect(context);
    } else {
      pushRouteEffect(path: "/mangadetails");
    }
  }

  void popScreen(BuildContext context) {
    popRouteEffect(context);
    close();
  }

  Future<void> updateSearchQuery(String query) async {
    emit(state.copyWith(searchQuery: query));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating search query $e", stackTrace: stackTrace);
      handleError("Error updating search query", stackTrace: stackTrace);
    }
  }

  void updateGenres(List<String> genres) {
    emit(state.copyWith(selectedGenres: genres));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating selected genres $e", stackTrace: stackTrace);
      handleError("Error updating selected genres", stackTrace: stackTrace);
    }
  }

  void updateSearchSortOption(String sortOption) {
    emit(state.copyWith(selectedSearchSortOption: sortOption));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating search sortOption $e", stackTrace: stackTrace);
      handleError("Error updating search sortOption", stackTrace: stackTrace);
    }
  }

  void updateSearchSortOrder(String sortOrder) {
    emit(state.copyWith(selectedSearchOrder: sortOrder));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating search sortOrder $e", stackTrace: stackTrace);
      handleError("Error updating search sortOrder", stackTrace: stackTrace);
    }
  }

  Future<void> updateSelectedYear(String? year) async {
    emit(state.copyWith(selectedYear: year));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating year $e", stackTrace: stackTrace);
      handleError("Error updating year", stackTrace: stackTrace);
    }
  }

  Future<void> updateSelectedCountryOfOrigin(String? countryOfOrigin) async {
    emit(state.copyWith(selectedCountryOfOrigin: countryOfOrigin));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating season $e", stackTrace: stackTrace);
      handleError("Error updating season", stackTrace: stackTrace);
    }
  }

  Future<void> updateSelectedFormat(String? format) async {
    emit(state.copyWith(selectedFormat: format));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating format $e", stackTrace: stackTrace);
      handleError("Error updating format", stackTrace: stackTrace);
    }
  }

  Future<void> updateSelectedPublishingStatus(String? publishingStatus) async {
    emit(state.copyWith(selectedPublishingStatus: publishingStatus));
    try {
      _performMangaAdvancedSearch();
    } catch (e, stackTrace) {
      _logger.e("Error updating airing status $e", stackTrace: stackTrace);
      handleError("Error updating airing status", stackTrace: stackTrace);
    }
  }

  Future<void> _getLoggedUserServiceFilters(User loggedUser) async {
    try {
      switch (loggedUser.settings.service) {
        case Service.anilist:
          final filters = await _mangaRepositoryAnilist.getUserMangaAdvancedSearchFilters();
          emit(
            state.copyWith(
              genresFilters: (filters['genres']?.$1 ?? false, filters['genres']?.$2 ?? []),
              countryOfOriginsFilters: (filters['countriesOfOrigin']?.$1 ?? false, filters['countriesOfOrigin']?.$2 ?? []),
              formatFilters: (filters['formats']?.$1 ?? false, filters['formats']?.$2 ?? []),
              publishingStatusFilters: (
                filters['publishingStatuses']?.$1 ?? false,
                filters['publishingStatuses']?.$2 ?? [],
              ),
              yearFilters: (filters['years']?.$1 ?? false, filters['years']?.$2 ?? []),
              searchSortOptions: (filters['sortOptions']?.$1 ?? false, filters['sortOptions']?.$2 ?? []),
              searchSortOrder: (filters['sortOrders']?.$1 ?? false, filters['sortOrders']?.$2 ?? []),
            ),
          );
          break;
        case Service.mal:
        case Service.shikimori:
        case Service.simkl:
        case Service.kitsu:
      }
    } catch (e, stackTrace) {
      _logger.e("Error getting logged user service filters $e", stackTrace: stackTrace);
      handleError("Error getting logged user service filters", stackTrace: stackTrace);
    }
  }

  Future<void> _performMangaAdvancedSearch() async {
    switch (state.loggedUser.settings.service) {
      case Service.anilist:
        List<Manga> searchResults = await _mangaRepositoryAnilist.performMangaAdvancedSearch(
          state.searchQuery,
          state.selectedGenres,
          state.selectedCountryOfOrigin,
          state.selectedFormat,
          int.tryParse(state.selectedYear ?? ''),
          state.selectedPublishingStatus,
          "${state.selectedSearchSortOption.toUpperCase().replaceAll(" ", "_")}_${state.selectedSearchOrder.toUpperCase()}",
          1,
          state.loggedUser
        );
        emit(state.copyWith(searchResults: searchResults));
      case Service.mal:
      case Service.shikimori:
      case Service.simkl:
      case Service.kitsu:
    }
  }
}