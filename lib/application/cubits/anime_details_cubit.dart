import 'dart:async';

import 'package:k3vinb5_aniyomi_bridge/aniyomi_bridge.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:bloc/bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/service.dart';
import 'package:unyo/core/notification/anime_notifier.dart';
import 'package:unyo/core/notification/media_list_notifier.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/data/repositories/anime_repository_anilist.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/anime_details.dart';
import 'package:unyo/domain/entities/media_list.dart';
import 'package:unyo/domain/entities/user.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState>
    with EffectMixin<AnimeDetailsState> {
  // Repositories
  final AnimeRepositoryAnilist _animeRepositoryAnilist;

  // Notifiers / Subscriptions
  final AnimeNotifier _selectedAnimeNotifier;
  final UserNotifier _loggedUserNotifier;
  final MediaListNotifier _selectedMediaListNotifier;
  late StreamSubscription<Anime> _selectedAnimeSubscription;
  late StreamSubscription<User> _loggedUserSubscription;
  late StreamSubscription<MediaList> _selectedMediaListSubscription;

  // Logger
  final Logger _logger = sl<Logger>();

  // Services
  final AniyomiBridge aniyomiBridge = sl<AniyomiBridge>();

  AnimeDetailsCubit(
    this._animeRepositoryAnilist,
    this._loggedUserNotifier,
    this._selectedAnimeNotifier,
    this._selectedMediaListNotifier,
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
        ),
      ) {
    _init();
  }

  @override
  AnimeDetailsState copyStateWithEffects(
    AnimeDetailsState state,
    List<AppEffect> effects,
  ) {
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
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((user) {
      emit(state.copyWith(loggedUser: user));
    });
    _selectedAnimeSubscription = _selectedAnimeNotifier.animeStream.listen((
      anime,
    ) {
      _getAnimeDetails(state.loggedUser, anime);
      emit(state.copyWith(selectedAnime: anime));
    });
    _selectedMediaListSubscription = _selectedMediaListNotifier.mediaListStream.listen((
      mediaList,
    ) {
      emit(state.copyWith(selectedMediaList: mediaList));
    });
  }

  void navigateToAnimeDetails(Anime anime, MediaList mediaList) {
    _logger.i("Navigating to Anime Details of ${anime.title}");
    _selectedAnimeNotifier.updateSelectedAnime(anime);
    _selectedMediaListNotifier.updateSelectedMediaList(mediaList);
  }

  Future<void> _getAnimeDetails(User loggedUser, Anime selectedAnime) async {
    switch (loggedUser.settings.service) {
      case Service.anilist:
        _logger.i(
          "Fetching Anime Details from AniList for ${state.selectedAnime.title}",
        );
        (bool, AnimeDetails) animeDetails = await _animeRepositoryAnilist
            .getAnimeDetails(selectedAnime, loggedUser);
        emit(
          state.copyWith(
            characters: (true, animeDetails.$2.characters),
            repeat: animeDetails.$2.repeat,
            score: animeDetails.$2.score,
            progress: animeDetails.$2.progress,
            recommendations: (true, animeDetails.$2.recommendedAnimes),
          ),
        );
      case Service.mal:
        _logger.i(
          "Fetching Anime Details from MyAnimeList for ${state.selectedAnime.title}",
        );
      case Service.shikimori:
        _logger.i(
          "Fetching Anime Details from Shikimori for ${state.selectedAnime.title}",
        );
      case Service.kitsu:
        _logger.i(
          "Fetching Anime Details from Kitsu for ${state.selectedAnime.title}",
        );
      case Service.simkl:
        _logger.i(
          "Fetching Anime Details from Simkl for ${state.selectedAnime.title}",
        );
    }
  }
}
