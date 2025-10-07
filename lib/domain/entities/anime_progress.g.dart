// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_progress.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeProgressModelAdapter extends TypeAdapter<AnimeProgressModel> {
  @override
  final typeId = 4;

  @override
  AnimeProgressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeProgressModel(
      progress: (fields[0] as num).toInt(),
      score: (fields[1] as num).toInt(),
      repeat: (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, AnimeProgressModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.progress)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.repeat);
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

_AnimeProgressModel _$AnimeProgressModelFromJson(Map<String, dynamic> json) =>
    _AnimeProgressModel(
      progress: (json['progress'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      repeat: (json['repeat'] as num).toInt(),
    );

Map<String, dynamic> _$AnimeProgressModelToJson(_AnimeProgressModel instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'score': instance.score,
      'repeat': instance.repeat,
    };
