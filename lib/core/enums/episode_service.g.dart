// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeServiceEnumAdapter extends TypeAdapter<EpisodeService> {
  @override
  final typeId = 6;

  @override
  EpisodeService read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EpisodeService.anizip;
      case 1:
        return EpisodeService.kitsu;
      default:
        return EpisodeService.anizip;
    }
  }

  @override
  void write(BinaryWriter writer, EpisodeService obj) {
    switch (obj) {
      case EpisodeService.anizip:
        writer.writeByte(0);
      case EpisodeService.kitsu:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeServiceEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
