import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';

part 'media_list_state.freezed.dart';

@freezed
abstract class MediaListState with _$MediaListState implements HasEffects{
  const factory MediaListState({
    // required List<Anime> continueWatching,
    // required List<Manga> continueReading,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _MediaListState;

  const MediaListState._();

  @override
  List<AppEffect> get stateEffects => effects;
}