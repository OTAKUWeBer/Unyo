import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:unyo/core/enums/episode_service.dart';
import 'package:unyo/core/enums/service.dart';
import 'package:unyo/data/adapters/adapters_names.dart' as names;
import 'package:unyo/data/adapters/adapters_types.dart' as types;
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/domain/entities/extension.dart';

part 'settings.freezed.dart';

part 'settings.g.dart';

abstract class Settings {
  final String language;
  final Service service;
  final EpisodeService episodeService;
  final List<Extension> installedAnimeExtensions;
  final List<Extension> installedMangaExtensions;
  final String aniyomiExtensionsRepositoryUrl;
  final String tachiyomiExtensionsRepositoryUrl;

  const Settings({
    required this.service,
    required this.language,
    required this.episodeService,
    required this.installedAnimeExtensions,
    required this.installedMangaExtensions,
    required this.aniyomiExtensionsRepositoryUrl,
    required this.tachiyomiExtensionsRepositoryUrl
  });
}

@freezed
@HiveType(typeId: types.settingsAdapterType, adapterName: names.settingsModelAdapterName)
abstract class SettingsModel with _$SettingsModel implements Settings {
  const factory SettingsModel({
    @HiveField(0) @Default('en') String language,
    @HiveField(1) @Default(Service.anilist) Service service,
    @HiveField(2) @Default(EpisodeService.anizip) EpisodeService episodeService,
    @HiveField(3) @ExtensionConverter() @Default([]) List<Extension> installedAnimeExtensions,
    @HiveField(4) @ExtensionConverter() @Default([]) List<Extension> installedMangaExtensions,
    @HiveField(5) @Default(config.aniyomiExtensionsRepositoryUrl) String aniyomiExtensionsRepositoryUrl,
    @HiveField(6) @Default(config.tachiyomiExtensionsRepositoryUrl) String tachiyomiExtensionsRepositoryUrl,
  }) = _SettingsModel;

  factory SettingsModel.empty() =>
      const SettingsModel();

  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SettingsModelToJson(this as _SettingsModel);
}

class SettingsConverter implements JsonConverter<Settings, Map<String, dynamic>> {
  const SettingsConverter();

  @override
  Settings fromJson(Map<String, dynamic> json) => SettingsModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(Settings object) => (object as SettingsModel).toJson();
}
