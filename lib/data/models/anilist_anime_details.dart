import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:unyo/core/services/api/dto/anime_details_graphql_dto_entity.dart';
import 'package:unyo/data/adapters/adapters_names.dart' as names;
import 'package:unyo/data/adapters/adapters_types.dart' as types;
import 'package:unyo/data/models/anilist_anime_model.dart';
import 'package:unyo/data/models/anilist_media_character.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/anime_details.dart';
import 'package:unyo/domain/entities/media_character.dart';

part 'anilist_anime_details.freezed.dart';

part 'anilist_anime_details.g.dart';

@freezed
@HiveType(
  typeId: types.anilistAnimeDetailsAdapterType,
  adapterName: names.anilistAnimeDetailsModelAdapterName,
)
abstract class AnilistAnimeDetailsModel
    with _$AnilistAnimeDetailsModel
    implements AnimeDetails {
  const factory AnilistAnimeDetailsModel({
    @HiveField(0) required int progress,
    @HiveField(1) required int score,
    @HiveField(2) required int repeat,
    @HiveField(3) @AnimeConverter() required List<Anime> recommendedAnimes,
    @HiveField(4)
    @MediaCharacterConverter()
    required List<MediaCharacter> characters,
  }) = _AnilistAnimeDetailsModel;

  factory AnilistAnimeDetailsModel.empty() => const AnilistAnimeDetailsModel(
    progress: 0,
    score: 0,
    repeat: 0,
    recommendedAnimes: [],
    characters: [],
  );

  factory AnilistAnimeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AnilistAnimeDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AnilistAnimeDetailsModelToJson(this as _AnilistAnimeDetailsModel);

  factory AnilistAnimeDetailsModel.fromAnimeDetailsMediaList(
    AnimeDetailsGraphqlDtoDataMediaList animeDetailsMediaList,
  ) {
    return AnilistAnimeDetailsModel(
      progress: animeDetailsMediaList.progress,
      score: animeDetailsMediaList.score,
      repeat: animeDetailsMediaList.repeat,
      recommendedAnimes:
          animeDetailsMediaList.media.recommendations.nodes
              .map(
                (recommendationNode) =>
                    AnilistAnimeModel.fromMediaRecommendationNode(
                          recommendationNode.mediaRecommendation,
                        )
                        as Anime,
              )
              .toList(),
      characters:
          animeDetailsMediaList.media.characters.nodes
              .map(
                (characterNode) =>
                    AnilistMediaCharacterModel.fromCharacterNode(characterNode)
                        as MediaCharacter,
              )
              .toList(),
    );
  }
}
