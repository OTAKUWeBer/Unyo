import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/manga.dart';

part 'manga_state.freezed.dart';

@freezed
abstract class MangaState with _$MangaState implements HasEffects{
  const factory MangaState({
    required List<Manga> recentlyReleased,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _MangaState;

  const MangaState._();

  @override
  List<AppEffect> get stateEffects => effects;
}