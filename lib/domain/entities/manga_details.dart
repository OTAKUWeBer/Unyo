import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/media_character.dart';

part 'manga_details.freezed.dart';
part 'manga_details.g.dart';

abstract class MangaDetails {
  final int progress;
  final int score;
  final int repeat;
  final List<Manga> recommendedMangas;
  final List<MediaCharacter> characters;

  const MangaDetails({required this.progress, required this.score, required this.repeat, required this.recommendedMangas, required this.characters});
}

@freezed
abstract class MangaDetailsModel with _$MangaDetailsModel implements MangaDetails {
  const factory MangaDetailsModel({
    required int progress,
    required int score,
    required int repeat,
    @MangaConverter() required List<Manga> recommendedMangas,
    @MediaCharacterConverter() required List<MediaCharacter> characters,
  }) = _MangaDetailsModel;

  factory MangaDetailsModel.empty() => const MangaDetailsModel(
      progress: 0,
      score: 0,
      repeat: 0,
      recommendedMangas: [],
      characters: []
  );

  factory MangaDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MangaDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$MangaDetailsModelToJson(this as _MangaDetailsModel);
}

class MangaDetailsConverter implements JsonConverter<MangaDetails, Map<String, dynamic>> {
  const MangaDetailsConverter();

  @override
  MangaDetails fromJson(Map<String, dynamic> json) => MangaDetailsModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(MangaDetails object) =>
      (object as MangaDetailsModel).toJson();
}
