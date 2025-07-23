import 'package:bloc/bloc.dart';
import 'package:logger/src/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> with EffectMixin<AnimeState> {
  AnimeCubit() : super(AnimeState(recentlyReleased: []));

  @override
  AnimeState copyStateWithEffects(AnimeState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  // TODO: implement logger
  Logger get logger => throw UnimplementedError();
}