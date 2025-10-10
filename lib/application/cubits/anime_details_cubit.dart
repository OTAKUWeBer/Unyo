import 'dart:async';

import 'package:k3vinb5_aniyomi_bridge/aniyomi_bridge.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_details_state.dart';
import 'package:bloc/bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/notification/anime_notifier.dart';
import 'package:unyo/core/notification/media_list_notifier.dart';
import 'package:unyo/core/notification/user_notifier.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/anime_progress.dart';
import 'package:unyo/domain/entities/media_list.dart';
import 'package:unyo/domain/entities/user.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState>
    with EffectMixin<AnimeDetailsState> {
  // Notifiers / Subscriptions
  final AnimeNotifier _selectedAnimeNotifier;
  final UserNotifier _loggedUserNotifier;
  final MediaListNotifier _selectedMediaList;
  late StreamSubscription<Anime> _selectedAnimeSubscription;
  late StreamSubscription<User> _loggedUserSubscription;
  late StreamSubscription<MediaList> _selectedMediaListSubscription;
  final Logger _logger = sl<Logger>();
  final AniyomiBridge aniyomiBridge = sl<AniyomiBridge>();

  AnimeDetailsCubit(this._loggedUserNotifier, this._selectedAnimeNotifier, this._selectedMediaList)
    : super(
        AnimeDetailsState(
          loggedUser: UserModel.empty(),
          selectedMediaList: MediaListModel.empty(),
          selectedAnime: AnimeModel.empty(),
          animeProgress: AnimeProgressModel.empty(),
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
  Logger get logger => _logger;

  void navigateBackToAnimePage() {
    _logger.d("Returning to Anime Page");
    popRouteEffect();
  }

  void _init() {
    _selectedAnimeSubscription = _selectedAnimeNotifier.animeStream.listen(
      (anime) {
        emit(state.copyWith(selectedAnime: anime));
      },
    );
    _loggedUserSubscription = _loggedUserNotifier.userStream.listen((
        user,
        )  {
      emit(
        state.copyWith(loggedUser: user),
      );
    });
    _selectedMediaListSubscription = _selectedMediaList.mediaListStream.listen((
        mediaList,
        )  {
      emit(
        state.copyWith(selectedMediaList: mediaList),
      );
    });
  }
}
