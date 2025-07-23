import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/media_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaListCubit extends Cubit<MediaListState> with EffectMixin<MediaListState> {
  MediaListCubit() : super(MediaListState());

  @override
  MediaListState copyStateWithEffects(MediaListState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  // TODO: implement logger
  Logger get logger => throw UnimplementedError();
}