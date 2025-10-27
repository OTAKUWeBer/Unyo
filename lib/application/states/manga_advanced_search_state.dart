import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';

part 'manga_advanced_search_state.freezed.dart';

@freezed
abstract class MangaAdvancedSearchState with _$MangaAdvancedSearchState implements HasEffects {
  const factory MangaAdvancedSearchState({
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _MangaAdvancedSearchState;

  const MangaAdvancedSearchState._();

  @override
  List<AppEffect> get stateEffects => effects;
}