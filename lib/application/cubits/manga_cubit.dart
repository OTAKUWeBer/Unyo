import 'package:logger/logger.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/manga_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'effect_mixin.dart';

class MangaCubit extends Cubit<MangaState> with EffectMixin<MangaState> {
  MangaCubit() : super(MangaState(recentlyReleased: []));

  @override
  MangaState copyStateWithEffects(MangaState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  // TODO: implement logger
  Logger get logger => throw UnimplementedError();
}