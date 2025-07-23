import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/anime.dart';

part 'anime_state.freezed.dart';

@freezed
abstract class AnimeState with _$AnimeState implements HasEffects{
  const factory AnimeState({
    required List<Anime> recentlyReleased,
    // required List<Manga> continueReading,
    // required bool isLoading,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _AnimeState;

  const AnimeState._();

  @override
  List<AppEffect> get stateEffects => effects;
}