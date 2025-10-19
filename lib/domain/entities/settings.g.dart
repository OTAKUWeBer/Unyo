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
      language: fields[0] == null ? 'en' : fields[0] as String,
      service: fields[1] == null ? Service.anilist : fields[1] as Service,
      episodeService:
          fields[2] == null
              ? EpisodeService.anizip
              : fields[2] as EpisodeService,
      installedAnimeExtensions:
          fields[3] == null ? [] : (fields[3] as List).cast<Extension>(),
      installedMangaExtensions:
          fields[4] == null ? [] : (fields[4] as List).cast<Extension>(),
      aniyomiExtensionsRepositoryUrl:
          fields[5] == null
              ? 'https://gitea.k3vinb5.dev/Backups/kohi-den-extensions/raw/branch/main/index.min.json'
              : fields[5] as String,
      tachiyomiExtensionsRepositoryUrl:
          fields[6] == null
              ? 'https://gitea.k3vinb5.dev/Backups/keiyoushi-extensions/raw/branch/repo/index.min.json'
              : fields[6] as String,
      mediaExtensionConfigs:
          fields[7] == null ? {} : (fields[7] as Map).cast<String, Extension>(),
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.language)
      ..writeByte(1)
      ..write(obj.service)
      ..writeByte(2)
      ..write(obj.episodeService)
      ..writeByte(3)
      ..write(obj.installedAnimeExtensions)
      ..writeByte(4)
      ..write(obj.installedMangaExtensions)
      ..writeByte(5)
      ..write(obj.aniyomiExtensionsRepositoryUrl)
      ..writeByte(6)
      ..write(obj.tachiyomiExtensionsRepositoryUrl)
      ..writeByte(7)
      ..write(obj.mediaExtensionConfigs);
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

_SettingsModel _$SettingsModelFromJson(
  Map<String, dynamic> json,
) => _SettingsModel(
  language: json['language'] as String? ?? 'en',
  service:
      $enumDecodeNullable(_$ServiceEnumMap, json['service']) ?? Service.anilist,
  episodeService:
      $enumDecodeNullable(_$EpisodeServiceEnumMap, json['episodeService']) ??
      EpisodeService.anizip,
  installedAnimeExtensions:
      (json['installedAnimeExtensions'] as List<dynamic>?)
          ?.map(
            (e) =>
                const ExtensionConverter().fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  installedMangaExtensions:
      (json['installedMangaExtensions'] as List<dynamic>?)
          ?.map(
            (e) =>
                const ExtensionConverter().fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  aniyomiExtensionsRepositoryUrl:
      json['aniyomiExtensionsRepositoryUrl'] as String? ??
      config.aniyomiExtensionsRepositoryUrl,
  tachiyomiExtensionsRepositoryUrl:
      json['tachiyomiExtensionsRepositoryUrl'] as String? ??
      config.tachiyomiExtensionsRepositoryUrl,
  mediaExtensionConfigs:
      (json['mediaExtensionConfigs'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          const ExtensionConverter().fromJson(e as Map<String, dynamic>),
        ),
      ) ??
      const {},
);

Map<String, dynamic> _$SettingsModelToJson(
  _SettingsModel instance,
) => <String, dynamic>{
  'language': instance.language,
  'service': _$ServiceEnumMap[instance.service]!,
  'episodeService': _$EpisodeServiceEnumMap[instance.episodeService]!,
  'installedAnimeExtensions':
      instance.installedAnimeExtensions
          .map(const ExtensionConverter().toJson)
          .toList(),
  'installedMangaExtensions':
      instance.installedMangaExtensions
          .map(const ExtensionConverter().toJson)
          .toList(),
  'aniyomiExtensionsRepositoryUrl': instance.aniyomiExtensionsRepositoryUrl,
  'tachiyomiExtensionsRepositoryUrl': instance.tachiyomiExtensionsRepositoryUrl,
  'mediaExtensionConfigs': instance.mediaExtensionConfigs.map(
    (k, e) => MapEntry(k, const ExtensionConverter().toJson(e)),
  ),
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
