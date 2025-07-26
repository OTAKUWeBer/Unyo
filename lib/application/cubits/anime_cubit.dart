// External dependencies
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_state.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/enums/service.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/data/repositories/anime_repository_anilist.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/user.dart';

class AnimeCubit extends Cubit<AnimeState> with EffectMixin<AnimeState> {
  final AnimeRepositoryAnilist _animeRepositoryAnilist;
  final UserNotifier _loggedUserNotifier;
  late StreamSubscription<User> _loggedUserSubscription;
  final Logger _logger = sl<Logger>();

  AnimeCubit(this._animeRepositoryAnilist, this._loggedUserNotifier)
    : super(
        AnimeState(
          recentlyReleased: (false, []),
          popular: (false, []),
          trending: (false, []),
          recentlyCompleted: (false, []),
          upcoming: (false, []),
          banners: [],
          loggedUser: UserModel.empty(),
          isLoading: true,
        ),
      ) {
    _init();
  }

  @override
  AnimeState copyStateWithEffects(AnimeState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  @override
  Future<void> close() {
    _loggedUserSubscription.cancel();
    return super.close();
  }

  void _init() {
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((
      loggedUser,
    ) {
      emit(state.copyWith(loggedUser: loggedUser));
    });
    _fetchRecentlyReleased(1);
    _fetchTrending(1);
    _fetchRecentlyCompleted(1);
    _fetchPopular(1);
    _fetchUpcoming(1);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _fetchRecentlyReleased(int page) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist recently released anime");
          (bool, List<Anime>) recentlyReleased = await _animeRepositoryAnilist.getRecentlyReleasedAnimes(page);
          emit(state.copyWith(recentlyReleased: recentlyReleased));
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError(
        "Failed to fetch recently released anime $e",
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _fetchTrending(int page) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist trending anime");
          (bool, List<Anime>) trending = await _animeRepositoryAnilist.getTrendingAnimes(page);
          emit(state.copyWith(trending: trending));
          if (page == 1) {
            emit(state.copyWith(banners: trending.$2.where((anime) => anime.bannerImage != "").toList()));
          }
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError(
        "Failed to fetch trending anime $e",
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _fetchPopular(int page) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist popular anime");
          (bool, List<Anime>) popular = await _animeRepositoryAnilist.getPopularAnimes(page);
          emit(state.copyWith(popular: popular));
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError(
        "Failed to fetch popular anime $e",
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _fetchRecentlyCompleted(int page) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist recently completed anime");
          (bool, List<Anime>) recentlyCompleted = await _animeRepositoryAnilist.getRecentlyCompletedAnimes(page);
          emit(state.copyWith(recentlyCompleted: recentlyCompleted));
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError(
        "Failed to fetch recently completed anime $e",
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _fetchUpcoming(int page) async {
    try {
      switch (state.loggedUser.settings.service) {
        case Service.anilist:
          _logger.i("Fetching Anilist upcoming anime");
          (bool, List<Anime>) upcoming = await _animeRepositoryAnilist.getUpcomingAnimes(page);
          emit(state.copyWith(upcoming: upcoming));
        case Service.mal:
        case Service.kitsu:
        case Service.shikimori:
        case Service.simkl:
      }
    } catch (e, stackTrace) {
      handleError(
        "Failed to fetch upcoming anime $e",
        stackTrace: stackTrace,
      );
    }
  }
}
