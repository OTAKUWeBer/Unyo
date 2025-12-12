import 'dart:async';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:k3vinb5_aniyomi_bridge/jmodels/jsanime.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:bloc/bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/episode_service.dart';
import 'package:unyo/core/enums/service.dart';
import 'package:unyo/core/notification/anime_genres_notifier.dart';
import 'package:unyo/core/notification/anime_notifier.dart';
import 'package:unyo/core/notification/media_list_notifier.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/core/services/api/http/http_exception.dart';
import 'package:unyo/data/models/anilist_user_model.dart';
import 'package:unyo/data/models/local_user_model.dart';
import 'package:unyo/data/repositories/anime_repository_anilist.dart';
import 'package:unyo/data/repositories/episode_repository_anizip.dart';
import 'package:unyo/data/repositories/extension_repository_aniyomi.dart';
import 'package:unyo/data/repositories/repositories.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/anime_details.dart';
import 'package:unyo/domain/entities/episode_info.dart';
import 'package:unyo/domain/entities/extension.dart';
import 'package:unyo/domain/entities/media_list.dart';
import 'package:unyo/domain/entities/media_list_entry.dart';
import 'package:unyo/domain/entities/settings.dart';
import 'package:unyo/domain/entities/user.dart';
import 'package:unyo/presentation/dialogs/anime_server_selection_dialog.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState> with EffectMixin<AnimeDetailsState> {
  // Repositories
  final AnimeRepositoryAnilist _animeRepositoryAnilist;
  final EpisodeRepositoryAnizip _episodeRepositoryAnizip;
  final ExtensionRepositoryAniyomi _extensionRepositoryAniyomi;
  final UserRepositoryAnilist _userRepositoryAnilist;

  // Notifiers / Subscriptions
  final UserNotifier _loggedUserNotifier;
  final AnimeNotifier _selectedAnimeNotifier;
  final AnimeGenresNotifier _selectedAnimeAdvancedSearchGenresFilters;
  final MediaListNotifier _selectedMediaListNotifier;
  late StreamSubscription<Anime> _selectedAnimeSubscription;
  late StreamSubscription<User> _loggedUserSubscription;
  late StreamSubscription<MediaList> _selectedMediaListSubscription;

  // Logger
  final Logger _logger = sl<Logger>();

  AnimeDetailsCubit(
    this._animeRepositoryAnilist,
    this._episodeRepositoryAnizip,
    this._loggedUserNotifier,
    this._selectedAnimeNotifier,
    this._selectedAnimeAdvancedSearchGenresFilters,
    this._selectedMediaListNotifier,
    this._extensionRepositoryAniyomi,
    this._userRepositoryAnilist,
  ) : super(
        AnimeDetailsState(
          loggedUser: UserModel.empty(),
          selectedMediaList: MediaListModel.empty(),
          selectedAnime: AnimeModel.empty(),
          mediaListEntry:MediaListEntryModel.empty(),
          characters: (false, []),
          recommendations: (false, []),
          episodesInfo: [],
          banners: [],
          alternateImage: '',
          installedExtensions: {},
          selectedExtension: null,
          userLoaded: false,
          extensionAnimeResults: [],
          extensionEpisodeResults: [],
          extensionVideoResults: [],
        ),
      ) {
    _init();
  }

  @override
  AnimeDetailsState copyStateWithEffects(AnimeDetailsState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Future<void> close() {
    _loggedUserSubscription.cancel();
    _selectedAnimeSubscription.cancel();
    _selectedMediaListSubscription.cancel();
    return super.close();
  }

  @override
  Logger get logger => _logger;

  void navigateBackToAnimePage(BuildContext context) {
    _logger.d("Returning to Anime Page");
    popRouteEffect(context);
    close();
  }

  void _init() {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((loggedUser) {
      emit(state.copyWith(loggedUser: loggedUser));
      if (!state.userLoaded) {
        _getAnimeBanners(loggedUser);
        emit(state.copyWith(userLoaded: true));
      }
    });
    _selectedAnimeSubscription = _selectedAnimeNotifier.animeStream.listen((anime) {
      _getAnimeDetails(state.loggedUser, anime);
      _getEpisodesDetails(state.loggedUser, anime);
      emit(state.copyWith(selectedAnime: anime));
    });
    _selectedMediaListSubscription = _selectedMediaListNotifier.mediaListStream.listen((mediaList) {
      emit(state.copyWith(selectedMediaList: mediaList));
    });
    _loadInstalledExtensions();
  }

  void navigateToAnimeDetails(Anime anime, MediaList mediaList) {
    _logger.i("Navigating to Anime Details of ${anime.title}");
    _selectedAnimeNotifier.updateSelectedAnime(anime);
    _selectedMediaListNotifier.updateSelectedMediaList(mediaList);
  }

  void navigateToAnimeAdvancedSearchScreenWithFilters(BuildContext context, String newAnimeGenre) {
    _logger.i("Navigating to Anime Advanced Search Filters");
    bool hasAnimeSearchInStack = AutoRouter.of(context).stackData.any(
          (route) => route.name == "AnimeAdvancedSearchRoute",
    );
    if (hasAnimeSearchInStack) {
      _selectedAnimeAdvancedSearchGenresFilters.updateSelectedAnimeGenre(newAnimeGenre);
      popRouteEffect(context);
    } else {
      _selectedAnimeAdvancedSearchGenresFilters.updateSelectedAnimeGenre(newAnimeGenre);
      pushRouteEffect(path: "/animesearch");
    }
  }

  Future<void> selectAnimeExtension(String? selectedAnimeExtensionName) async {
    Extension? selectedExtension =
        state.installedExtensions
            .where((extension) => selectedAnimeExtensionName == extension.name)
            .firstOrNull;
    if (selectedExtension != null) {
      switch (state.loggedUser) {
        case AnilistUserModel anilistUserModel:
          SettingsModel userSettings = anilistUserModel.settings as SettingsModel;
          Map<String, Extension> mediaExtensionsConfigUpdated = Map.from(userSettings.mediaExtensionConfigs);
          mediaExtensionsConfigUpdated.addAll({state.selectedAnime.id.toString(): selectedExtension});
          await _userRepositoryAnilist.updateUserInfo(
            anilistUserModel.copyWith(
              settings: userSettings.copyWith(mediaExtensionConfigs: mediaExtensionsConfigUpdated),
            ),
          );
        case LocalUserModel localUserModel:
      }
      _getAnimeInfoFromSelectedExtension(selectedExtension);
    } else {
      _logger.w("Selected extension $selectedAnimeExtensionName not found among installed extensions.");
      showSnackBarEffect(
        "Extension Not Found",
        message: "The selected extension is not installed.",
        contentType: ContentType.warning,
      );
    }
  }

  void openAnimeServerSelectionDialog(BuildContext context) {
    showWidgetDialogEffect(dialog: const AnimeServerSelectionDialog());
  }

  Future<void> _getAnimeDetails(User loggedUser, Anime selectedAnime) async {
    try {
      switch (loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anime Details from AniList for ${state.selectedAnime.title}");
          (bool, AnimeDetails) animeDetails = await _animeRepositoryAnilist.getAnimeDetails(
            selectedAnime,
            loggedUser,
          );
          emit(
            state.copyWith(
              characters: (animeDetails.$2.characters.isNotEmpty, animeDetails.$2.characters),
              mediaListEntry: animeDetails.$2.mediaListEntry,
              recommendations: (
                animeDetails.$2.recommendedAnimes.isNotEmpty,
                animeDetails.$2.recommendedAnimes,
              ),
            ),
          );
          if (animeDetails.$2.recommendedAnimes.isEmpty) {
            (bool, List<Anime>) trendingAnimes = await _animeRepositoryAnilist.getTrendingAnimes(1, loggedUser);
            emit(state.copyWith(recommendations: (trendingAnimes.$1, trendingAnimes.$2.shuffled(Random()))));
          }
          _getAlternativeImage(loggedUser, selectedAnime);
        case Service.mal:
          _logger.i("Fetching Anime Details from MyAnimeList for ${state.selectedAnime.title}");
        case Service.shikimori:
          _logger.i("Fetching Anime Details from Shikimori for ${state.selectedAnime.title}");
        case Service.kitsu:
          _logger.i("Fetching Anime Details from Kitsu for ${state.selectedAnime.title}");
        case Service.simkl:
          _logger.i("Fetching Anime Details from Simkl for ${state.selectedAnime.title}");
      }
    } on HttpServerException catch (e, stackTrace) {
      handleError("Error fetching Anime details:", responseBody: e.message, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      handleError("Error fetching Anime Details: $e", stackTrace: stackTrace);
    }
  }

  Future<void> _loadInstalledExtensions() async {
    try {
      _logger.i("Loading installed extensions for Aniyomi");
      Set<Extension> installedExtensions = await _extensionRepositoryAniyomi.getInstalledAnimeExtensions(
        state.loggedUser,
      );
      emit(state.copyWith(installedExtensions: installedExtensions));
      _setSelectedExtension(state.loggedUser, state.selectedAnime);
    } catch (e, stackTrace) {
      handleError("Failed to load installed extensions $e", stackTrace: stackTrace);
    }
  }

  Future<void> _getAnimeInfoFromSelectedExtension(Extension selectedExtension) async {
    try {
      if (state.installedExtensions.isEmpty) {
        _logger.w("No installed extensions available to fetch anime info.");
        showSnackBarEffect(
          "No Installed Extensions",
          message: "Install some extensions if you want to watch some content",
          contentType: ContentType.warning,
        );
        return;
      }
      _logger.i(
        "Fetching Anime Info from extension ${selectedExtension.name} for ${state.selectedAnime.title.userPreferred}",
      );
      List<JSAnime> animeResults = await _extensionRepositoryAniyomi.getAnimeSearchResults(
        state.selectedAnime.title.userPreferred,
        selectedExtension,
      );
      emit(state.copyWith(extensionAnimeResults: animeResults));
    } catch (e, stackTrace) {
      handleError("Error fetching Anime Info from selected extension: $e", stackTrace: stackTrace);
    }
  }

  Future<void> _getAlternativeImage(User loggedUser, Anime selectedAnime) async {
    try {
      switch (loggedUser.settings.episodeService) {
        case EpisodeService.anizip:
          _logger.i("Fetching Alternative Image from Anizip for ${state.selectedAnime.title}");
          late String alternateImage;
          if (loggedUser.settings.service == Service.anilist) {
            alternateImage = await _episodeRepositoryAnizip.getAlternativeImage(
              malId: -1,
              anilistId: selectedAnime.id,
            );
          } else {
            alternateImage = await _episodeRepositoryAnizip.getAlternativeImage(
              malId: selectedAnime.idMal,
              anilistId: -1,
            );
          }
          emit(state.copyWith(alternateImage: alternateImage));
        case EpisodeService.kitsu:
          _logger.i("Fetching Alternative Image from Kitsu for ${state.selectedAnime.title}");
      }
    } on HttpServerException catch (e, stackTrace) {
      handleError("Error fetching Alternative Image:", responseBody: e.message, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      handleError("Error fetching Alternative Image: $e", stackTrace: stackTrace);
    }
  }

  Future<void> _getEpisodesDetails(User loggedUser, Anime selectedAnime) async {
    try {
      switch (loggedUser.settings.episodeService) {
        case EpisodeService.anizip:
          _logger.i("Fetching Episodes Details from Anizip for ${state.selectedAnime.title}");
          late List<EpisodeInfo> episodesInfo;
          if (loggedUser.settings.service == Service.anilist) {
            episodesInfo = await _episodeRepositoryAnizip.getEpisodeInfo(
              malId: -1,
              anilistId: selectedAnime.id,
            );
          } else {
            episodesInfo = await _episodeRepositoryAnizip.getEpisodeInfo(
              malId: selectedAnime.idMal,
              anilistId: -1,
            );
          }
          emit(state.copyWith(episodesInfo: episodesInfo));
        case EpisodeService.kitsu:
          _logger.i("Fetching Episodes Details from Kitsu for ${state.selectedAnime.title}");
      }
    } on HttpServerException catch (e, stackTrace) {
      handleError("Error fetching Episodes details:", responseBody: e.message, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      handleError("Error fetching Episodes Details: $e", stackTrace: stackTrace);
    }
  }

  Future<void> _getAnimeBanners(User loggedUser) async {
    try {
      switch (loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anime Banners from AniList for ${state.selectedAnime.title}");
          List<String> banners = await _animeRepositoryAnilist.getMediaCoverImages(loggedUser);
          emit(state.copyWith(banners: banners));
        case Service.mal:
          _logger.i("Fetching Anime Banners from MyAnimeList for ${state.selectedAnime.title}");
        case Service.shikimori:
          _logger.i("Fetching Anime Banners from Shikimori for ${state.selectedAnime.title}");
        case Service.kitsu:
          _logger.i("Fetching Anime Banners from Kitsu for ${state.selectedAnime.title}");
        case Service.simkl:
          _logger.i("Fetching Anime Banners from Simkl for ${state.selectedAnime.title}");
      }
    } on HttpServerException catch (e, stackTrace) {
      handleError("Error fetching Anime banners:", responseBody: e.message, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      handleError("Error fetching Anime Banners: $e", stackTrace: stackTrace);
    }
  }

  Future<void> _setSelectedExtension(User loggedUser, Anime selectedAnime) async {
    try {
      switch (loggedUser) {
        case AnilistUserModel anilistUserModel:
          SettingsModel userSettings = anilistUserModel.settings as SettingsModel;
          Extension? selectedExtension = userSettings.mediaExtensionConfigs[selectedAnime.id.toString()];
          if (selectedExtension != null) {
            selectAnimeExtension(selectedExtension.name);
            emit(state.copyWith(selectedExtension: selectedExtension));
          }
        case LocalUserModel localUserModel:
      }
    } catch (e, stackTrace) {
      handleError("Error setting selected extension: $e", stackTrace: stackTrace);
    }
  }
}
