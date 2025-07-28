import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/media_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/domain/entities/user.dart';

class MediaListCubit extends Cubit<MediaListState>
    with EffectMixin<MediaListState> {
  final Logger _logger = sl<Logger>();
  MediaListCubit()
    : super(
        MediaListState(
          userAnimeLists: {},
          userMangaLists: {},
          loggedUser: UserModel.empty(),
        ),
      );

  @override
  MediaListState copyStateWithEffects(
    MediaListState state,
    List<AppEffect> effects,
  ) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;
}
