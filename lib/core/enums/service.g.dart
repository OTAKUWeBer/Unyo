// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceEnumAdapter extends TypeAdapter<Service> {
  @override
  final typeId = 3;

  @override
  Service read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Service.anilist;
      case 1:
        return Service.mal;
      case 2:
        return Service.kitsu;
      case 3:
        return Service.shikimori;
      case 4:
        return Service.simkl;
      default:
        return Service.anilist;
    }
  }

  @override
  void write(BinaryWriter writer, Service obj) {
    switch (obj) {
      case Service.anilist:
        writer.writeByte(0);
      case Service.mal:
        writer.writeByte(1);
      case Service.kitsu:
        writer.writeByte(2);
      case Service.shikimori:
        writer.writeByte(3);
      case Service.simkl:
        writer.writeByte(4);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
