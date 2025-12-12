import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:unyo/core/services/api/dto/anilist/media_details_graphql_entity.dart';
import 'package:unyo/data/adapters/adapters_names.dart' as names;
import 'package:unyo/data/adapters/adapters_types.dart' as types;
import 'package:unyo/data/models/anilist_manga_model.dart';
import 'package:unyo/data/models/anilist_media_character.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/manga_details.dart';
import 'package:unyo/domain/entities/media_character.dart';
import 'package:unyo/domain/entities/media_list_entry.dart';

part 'anilist_manga_details.freezed.dart';

part 'anilist_manga_details.g.dart';

@freezed
@HiveType(
  typeId: types.anilistMangaDetailsAdapterType,
  adapterName: names.anilistMangaDetailsModelAdapterName,
)
abstract class AnilistMangaDetailsModel
    with _$AnilistMangaDetailsModel
    implements MangaDetails {
  const factory AnilistMangaDetailsModel({
    @HiveField(0) @MediaListEntryConverter() required MediaListEntry mediaListEntry,
    @HiveField(1) @MangaConverter() required List<Manga> recommendedMangas,
    @HiveField(2) @MediaCharacterConverter() required List<MediaCharacter> characters,
  }) = _AnilistMangaDetailsModel;

  factory AnilistMangaDetailsModel.empty() =>
      AnilistMangaDetailsModel(
        mediaListEntry: MediaListEntryModel.empty(),
        recommendedMangas: [],
        characters: [],
      );

  factory AnilistMangaDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AnilistMangaDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AnilistMangaDetailsModelToJson(this as _AnilistMangaDetailsModel);

  factory AnilistMangaDetailsModel.fromMangaDetailsMediaList(
      MediaDetailsGraphqlMedia mangaDetailsMediaList,) {
    return AnilistMangaDetailsModel(
        mediaListEntry: MediaListEntryModel(
        progress: mangaDetailsMediaList.mediaListEntry?.progress ?? -1,
        score: mangaDetailsMediaList.mediaListEntry?.score ?? -1,
        repeat: mangaDetailsMediaList.mediaListEntry?.repeat ?? -1,
        status: mangaDetailsMediaList.mediaListEntry?.status ?? "ADD TO LIST",
        startedAt: [
          mangaDetailsMediaList.mediaListEntry?.startedAt.day.toString() ?? "~",
          mangaDetailsMediaList.mediaListEntry?.startedAt.month.toString() ?? "~",
          mangaDetailsMediaList.mediaListEntry?.startedAt.year.toString() ?? "~",
        ],
        completedAt: [
          mangaDetailsMediaList.mediaListEntry?.completedAt.day.toString() ?? "~",
          mangaDetailsMediaList.mediaListEntry?.completedAt.month.toString() ?? "~",
          mangaDetailsMediaList.mediaListEntry?.completedAt.year.toString() ?? "~",
        ],
      ),
        recommendedMangas: mangaDetailsMediaList.recommendations.nodes
              .map(
                (recommendationNode) =>
                    AnilistMangaModel.fromMediaRecommendationNode(
                          recommendationNode.mediaRecommendation,
                        )
                        as Manga,
              )
              .toList(),
        characters: mangaDetailsMediaList.characters.nodes
              .map(
                (characterNode) =>
                    AnilistMediaCharacterModel.fromCharacterNode(characterNode)
                        as MediaCharacter,
              )
              .toList(),
    );
  }
}
