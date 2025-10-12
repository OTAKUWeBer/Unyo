// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anilist_anime_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeProgressModelAdapter extends TypeAdapter<AnilistAnimeDetailsModel> {
  @override
  final typeId = 4;

  @override
  AnilistAnimeDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnilistAnimeDetailsModel(
      progress: (fields[0] as num).toInt(),
      score: (fields[1] as num).toInt(),
      repeat: (fields[2] as num).toInt(),
      recommendedAnimes: (fields[3] as List).cast<Anime>(),
      characters: (fields[4] as List).cast<MediaCharacter>(),
    );
  }

  @override
  void write(BinaryWriter writer, AnilistAnimeDetailsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.progress)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.repeat)
      ..writeByte(3)
      ..write(obj.recommendedAnimes)
      ..writeByte(4)
      ..write(obj.characters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeProgressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnilistAnimeDetailsModel _$AnilistAnimeDetailsModelFromJson(
  Map<String, dynamic> json,
) => _AnilistAnimeDetailsModel(
  progress: (json['progress'] as num).toInt(),
  score: (json['score'] as num).toInt(),
  repeat: (json['repeat'] as num).toInt(),
  recommendedAnimes:
      (json['recommendedAnimes'] as List<dynamic>)
          .map(
            (e) => const AnimeConverter().fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$AnilistAnimeDetailsModelToJson(
  _AnilistAnimeDetailsModel instance,
) => <String, dynamic>{
  'progress': instance.progress,
  'score': instance.score,
  'repeat': instance.repeat,
  'recommendedAnimes':
      instance.recommendedAnimes.map(const AnimeConverter().toJson).toList(),
  'characters':
      instance.characters.map(const MediaCharacterConverter().toJson).toList(),
};
