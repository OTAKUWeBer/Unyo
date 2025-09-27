import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/user.dart';

part 'anime_details_state.freezed.dart';

@freezed
abstract class AnimeDetailsState with _$AnimeDetailsState implements HasEffects{
  const factory AnimeDetailsState({
    required User loggedUser,
    required Anime selectedAnime,
    // relations
    // characters
    // voice actors
    // recommendations
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _AnimeDetailsState;

  const AnimeDetailsState._();

  @override
  List<AppEffect> get stateEffects => effects;
}
