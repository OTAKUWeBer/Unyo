// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeDetailsModel _$AnimeDetailsModelFromJson(Map<String, dynamic> json) =>
    _AnimeDetailsModel(
      progress: (json['progress'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      repeat: (json['repeat'] as num).toInt(),
      recommendedAnimes:
          (json['recommendedAnimes'] as List<dynamic>)
              .map(
                (e) =>
                    const AnimeConverter().fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      characters:
          (json['characters'] as List<dynamic>)
              .map(
                (e) => const MediaCharacterConverter().fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );

Map<String, dynamic> _$AnimeDetailsModelToJson(
  _AnimeDetailsModel instance,
) => <String, dynamic>{
  'progress': instance.progress,
  'score': instance.score,
  'repeat': instance.repeat,
  'recommendedAnimes':
      instance.recommendedAnimes.map(const AnimeConverter().toJson).toList(),
  'characters':
      instance.characters.map(const MediaCharacterConverter().toJson).toList(),
};
