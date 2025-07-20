import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/domain/entities/airing_episode.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/title.dart';

part 'anilist_anime_model.freezed.dart';
part 'anilist_anime_model.g.dart';

@freezed
abstract class AnilistAnimeModel with _$AnilistAnimeModel implements Anime {
  const AnilistAnimeModel._();

  factory AnilistAnimeModel({
    required int id,
    required int idMal,
    @TitleConverter()
    required Title title,
    required int averageScore,
    required String bannerImage,
    required String countryOfOrigin,
    required String coverImage,
    required String description,
    required int duration,
    required String endDate,
    required String startDate,
    required int episodes,
    required List<String> genres,
    required String format,
    required bool isAdult,
    required int popularity,
    required int meanScore,
    required String season,
    required bool isFavourite,
    @AiringEpisodeConverter()
    required AiringEpisode nextAiringEpisode,
  }) = _AnilistAnimeModel;

  factory AnilistAnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnilistAnimeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AnilistAnimeModelToJson(this as _AnilistAnimeModel);
}