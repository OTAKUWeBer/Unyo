// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anilist_manga_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaProgressModelAdapter extends TypeAdapter<AnilistMangaDetailsModel> {
  @override
  final typeId = 8;

  @override
  AnilistMangaDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnilistMangaDetailsModel(
      progress: (fields[0] as num).toInt(),
      score: (fields[1] as num).toInt(),
      repeat: (fields[2] as num).toInt(),
      recommendedMangas: (fields[3] as List).cast<Manga>(),
      characters: (fields[4] as List).cast<MediaCharacter>(),
    );
  }

  @override
  void write(BinaryWriter writer, AnilistMangaDetailsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.progress)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.repeat)
      ..writeByte(3)
      ..write(obj.recommendedMangas)
      ..writeByte(4)
      ..write(obj.characters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaProgressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnilistMangaDetailsModel _$AnilistMangaDetailsModelFromJson(
  Map<String, dynamic> json,
) => _AnilistMangaDetailsModel(
  progress: (json['progress'] as num).toInt(),
  score: (json['score'] as num).toInt(),
  repeat: (json['repeat'] as num).toInt(),
  recommendedMangas:
      (json['recommendedMangas'] as List<dynamic>)
          .map(
            (e) => const MangaConverter().fromJson(e as Map<String, dynamic>),
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

Map<String, dynamic> _$AnilistMangaDetailsModelToJson(
  _AnilistMangaDetailsModel instance,
) => <String, dynamic>{
  'progress': instance.progress,
  'score': instance.score,
  'repeat': instance.repeat,
  'recommendedMangas':
      instance.recommendedMangas.map(const MangaConverter().toJson).toList(),
  'characters':
      instance.characters.map(const MediaCharacterConverter().toJson).toList(),
};
