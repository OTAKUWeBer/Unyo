import 'dart:async';

import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/media_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/data/models/anilist_user_model.dart';
import 'package:unyo/data/models/local_user_model.dart';
import 'package:unyo/data/repositories/user_repository_anilist.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/user.dart';

class MediaListCubit extends Cubit<MediaListState> with EffectMixin<MediaListState> {
  final Logger _logger = sl<Logger>();
  final UserRepositoryAnilist _userRepositoryAnilist;
  final UserNotifier _loggedUserNotifier;
  late StreamSubscription<User> _newLoggedUserSubscription;

  MediaListCubit(this._loggedUserNotifier, this._userRepositoryAnilist)
    : super(
        MediaListState(
          userAnimeLists: {},
          userMangaLists: {},
          loggedUser: UserModel.empty(),
        ),
      ) {
    _init();
  }

  @override
  MediaListState copyStateWithEffects(
    MediaListState state,
    List<AppEffect> effects,
  ) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  @override
  Future<void> close() {
    _newLoggedUserSubscription.cancel();
    return super.close();
  }

  void _init() async {
    _newLoggedUserSubscription = _loggedUserNotifier.userStream.listen((loggedUser) {
      emit(state.copyWith(loggedUser: loggedUser));
      _getUserLists(loggedUser);
    });
  }

  Future<void> _getUserLists(User user) async {
    try {
      switch (user) {
        case AnilistUserModel anilistUserModel:
          _logger.i("Fetching Anilist User lists");
          Map<String, List<Anime>> userAnimeLists = await _userRepositoryAnilist
              .getUserAnimeLists(user);
          Map<String, List<Manga>> userMangaLists = await _userRepositoryAnilist
              .getUserMangaLists(user);
          emit(
            state.copyWith(
              userAnimeLists: userAnimeLists,
              userMangaLists: userMangaLists,
            ),
          );
        case LocalUserModel localUserModel:
      }
    } catch (e, stackTrace) {
      handleError("Error fetching user info: $e", stackTrace: stackTrace);
    }
  }
}
