import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/media_character.dart';

part 'anime_details.freezed.dart';
part 'anime_details.g.dart';

abstract class AnimeDetails {
  final int progress;
  final int score;
  final int repeat;
  final List<Anime> recommendedAnimes;
  final List<MediaCharacter> characters;

  const AnimeDetails({required this.progress, required this.score, required this.repeat, required this.recommendedAnimes, required this.characters});
}

@freezed
abstract class AnimeDetailsModel with _$AnimeDetailsModel implements AnimeDetails {
  const factory AnimeDetailsModel({
    required int progress,
    required int score,
    required int repeat,
    @AnimeConverter() required List<Anime> recommendedAnimes,
    @MediaCharacterConverter() required List<MediaCharacter> characters,
  }) = _AnimeDetailsModel;

  factory AnimeDetailsModel.empty() => const AnimeDetailsModel(
      progress: 0,
      score: 0,
      repeat: 0,
      recommendedAnimes: [],
      characters: []
  );

  factory AnimeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AnimeDetailsModelToJson(this as _AnimeDetailsModel);
}

class AnimeDetailsConverter implements JsonConverter<AnimeDetails, Map<String, dynamic>> {
  const AnimeDetailsConverter();

  @override
  AnimeDetails fromJson(Map<String, dynamic> json) => AnimeDetailsModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(AnimeDetails object) =>
      (object as AnimeDetailsModel).toJson();
}
