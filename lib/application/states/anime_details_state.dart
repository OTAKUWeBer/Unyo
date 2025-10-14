import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/episode_info.dart';
import 'package:unyo/domain/entities/media_character.dart';
import 'package:unyo/domain/entities/media_list.dart';
import 'package:unyo/domain/entities/user.dart';

part 'anime_details_state.freezed.dart';

@freezed
abstract class AnimeDetailsState with _$AnimeDetailsState implements HasEffects{
  const factory AnimeDetailsState({
    required User loggedUser,
    required MediaList selectedMediaList,
    required Anime selectedAnime,
    required int progress,
    required int score,
    required int repeat,
    required (bool, List<MediaCharacter>) characters,
    required (bool, List<Anime>) recommendations,
    required List<EpisodeInfo> episodesInfo,
    required List<String> banners,
    required String alternateImage,
    required int selectedExtension,
    required List<String> installedExtensions,
    // relations
    // voice actors
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _AnimeDetailsState;

  const AnimeDetailsState._();

  @override
  List<AppEffect> get stateEffects => effects;
}
