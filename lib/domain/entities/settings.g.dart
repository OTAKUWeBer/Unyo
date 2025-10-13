// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final typeId = 2;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      language: fields[0] as String,
      service: fields[1] as Service,
      episodeService: fields[2] as EpisodeService,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.language)
      ..writeByte(1)
      ..write(obj.service)
      ..writeByte(2)
      ..write(obj.episodeService);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) =>
    _SettingsModel(
      language: json['language'] as String,
      service: $enumDecode(_$ServiceEnumMap, json['service']),
      episodeService: $enumDecode(
        _$EpisodeServiceEnumMap,
        json['episodeService'],
      ),
    );

Map<String, dynamic> _$SettingsModelToJson(_SettingsModel instance) =>
    <String, dynamic>{
      'language': instance.language,
      'service': _$ServiceEnumMap[instance.service]!,
      'episodeService': _$EpisodeServiceEnumMap[instance.episodeService]!,
    };

const _$ServiceEnumMap = {
  Service.anilist: 'anilist',
  Service.mal: 'mal',
  Service.kitsu: 'kitsu',
  Service.shikimori: 'shikimori',
  Service.simkl: 'simkl',
};

const _$EpisodeServiceEnumMap = {
  EpisodeService.anizip: 'anizip',
  EpisodeService.kitsu: 'kitsu',
};
