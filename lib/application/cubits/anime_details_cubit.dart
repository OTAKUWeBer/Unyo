import 'dart:async';
import 'dart:math';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:collection/collection.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:bloc/bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/episode_service.dart';
import 'package:unyo/core/enums/service.dart';
import 'package:unyo/core/notification/anime_notifier.dart';
import 'package:unyo/core/notification/media_list_notifier.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/core/services/api/http/http_exception.dart';
import 'package:unyo/data/repositories/anime_repository_anilist.dart';
import 'package:unyo/data/repositories/episode_repository_anizip.dart';
import 'package:unyo/data/repositories/extension_repository_aniyomi.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/anime_details.dart';
import 'package:unyo/domain/entities/episode_info.dart';
import 'package:unyo/domain/entities/extension.dart';
import 'package:unyo/domain/entities/media_list.dart';
import 'package:unyo/domain/entities/user.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState> with EffectMixin<AnimeDetailsState> {
  // Repositories
  final AnimeRepositoryAnilist _animeRepositoryAnilist;
  final EpisodeRepositoryAnizip _episodeRepositoryAnizip;
  final ExtensionRepositoryAniyomi _extensionRepositoryAniyomi;

  // Notifiers / Subscriptions
  final AnimeNotifier _selectedAnimeNotifier;
  final UserNotifier _loggedUserNotifier;
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
    this._selectedMediaListNotifier,
    this._extensionRepositoryAniyomi,
  ) : super(
        AnimeDetailsState(
          loggedUser: UserModel.empty(),
          selectedMediaList: MediaListModel.empty(),
          selectedAnime: AnimeModel.empty(),
          progress: 0,
          score: 0,
          repeat: 0,
          characters: (false, []),
          recommendations: (false, []),
          episodesInfo: [],
          banners: [],
          alternateImage: '',
          selectedExtension: 0,
          installedExtensions: {},
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

  void navigateBackToAnimePage() {
    _logger.d("Returning to Anime Page");
    popRouteEffect();
  }

  void _init() {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((loggedUser) {
      _getAnimeBanners(loggedUser);
      emit(state.copyWith(loggedUser: loggedUser));
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

  Future<void> _getAnimeDetails(User loggedUser, Anime selectedAnime) async {
    try {
      switch (loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anime Details from AniList for ${state.selectedAnime.title}");
          (bool, AnimeDetails) animeDetails = await _animeRepositoryAnilist.getAnimeDetails(selectedAnime, loggedUser);
          emit(
            state.copyWith(
              characters: (animeDetails.$2.characters.isNotEmpty, animeDetails.$2.characters),
              repeat: animeDetails.$2.repeat,
              score: animeDetails.$2.score,
              progress: animeDetails.$2.progress,
              recommendations: (animeDetails.$2.recommendedAnimes.isNotEmpty, animeDetails.$2.recommendedAnimes),
            ),
          );
          if (animeDetails.$2.recommendedAnimes.isEmpty) {
            (bool, List<Anime>) trendingAnimes = await _animeRepositoryAnilist.getTrendingAnimes(1);
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
      Set<Extension> installedExtensions = await _extensionRepositoryAniyomi.getInstalledAnimeExtensions(state.loggedUser);
      emit(state.copyWith(installedExtensions: installedExtensions));
    } catch (e, stackTrace) {
      handleError("Failed to load installed extensions $e", stackTrace: stackTrace);
    }
  }

  Future<void> _getAnimeInfoFromSelectedExtension() async {
    try {
      if (state.installedExtensions.isEmpty) {
        _logger.w("No installed extensions available to fetch anime info.");
        showSnackBarEffect("No Installed Extensions", message: "Install some extensions if you want to watch some content", contentType: ContentType.warning);
        return;
      }
      Extension selectedExtension = state.installedExtensions.elementAt(state.selectedExtension);
      _logger.i("Fetching Anime Info from extension ${selectedExtension.name} for ${state.selectedAnime.title}");
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
            alternateImage = await _episodeRepositoryAnizip.getAlternativeImage(malId: -1, anilistId: selectedAnime.id);
          } else {
            alternateImage = await _episodeRepositoryAnizip.getAlternativeImage(malId: selectedAnime.idMal, anilistId: -1);
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
            episodesInfo = await _episodeRepositoryAnizip.getEpisodeInfo(malId: -1, anilistId: selectedAnime.id);
          } else {
            episodesInfo = await _episodeRepositoryAnizip.getEpisodeInfo(malId: selectedAnime.idMal, anilistId: -1);
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
          List<String> banners = await _animeRepositoryAnilist.getMediaCoverImages();
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
}
