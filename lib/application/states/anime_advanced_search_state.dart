import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';

part 'anime_advanced_search_state.freezed.dart';

@freezed
abstract class AnimeAdvancedSearchState with _$AnimeAdvancedSearchState implements HasEffects {
  const factory AnimeAdvancedSearchState({
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _AnimeAdvancedSearchState;

  const AnimeAdvancedSearchState._();

  @override
  List<AppEffect> get stateEffects => effects;
}