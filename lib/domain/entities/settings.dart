import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:unyo/core/enums/service.dart';
import 'package:unyo/data/adapters/adapters_names.dart' as names;
import 'package:unyo/data/adapters/adapters_types.dart' as types;

part 'settings.freezed.dart';
part 'settings.g.dart';

abstract class Settings {
  final String language;
  final Service service;

  Settings(this.service, {required this.language});
}

@freezed
@HiveType(typeId: types.settingsAdapterType, adapterName: names.settingsModelAdapterName)
abstract class SettingsModel with _$SettingsModel implements Settings {
  const factory SettingsModel({
    @HiveField(0) required String language,
    @HiveField(1) required Service service,
  }) = _SettingsModel;

  factory SettingsModel.empty() => const SettingsModel(
    language: 'en',
    service: Service.anilist
  );

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$SettingsModelToJson(this as _SettingsModel);
}

class SettingsConverter implements JsonConverter<Settings, Map<String, dynamic>> {
  const SettingsConverter();

  @override
  Settings fromJson(Map<String, dynamic> json) => SettingsModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(Settings object) =>
      (object as SettingsModel).toJson();
}