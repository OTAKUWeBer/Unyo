import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:unyo/data/adapters/adapters_names.dart' as names;
import 'package:unyo/data/adapters/adapters_types.dart' as types;

part 'media_list_entry.freezed.dart';
part 'media_list_entry.g.dart';

abstract class MediaListEntry {
  final int progress;
  final double score;
  final int repeat;
  final String status;
  final List<String> startedAt;
  final List<String> completedAt;
  // final List<> customLists;

  const MediaListEntry({required this.progress, required this.score, required this.repeat, required this.status, required this.startedAt, required this.completedAt});
}

@freezed
@HiveType(typeId: types.mediaListEntryAdapterType, adapterName: names.mangaListEntryModelAdapterName)
abstract class MediaListEntryModel with _$MediaListEntryModel implements MediaListEntry {
  const factory MediaListEntryModel({
    @HiveField(0) required int progress,
    @HiveField(1) required double score,
    @HiveField(2) required int repeat,
    @HiveField(3) required String status,
    @HiveField(4) required List<String> startedAt,
    @HiveField(5) required List<String> completedAt,
  }) = _MediaListEntryModel;

  factory MediaListEntryModel.empty() => const MediaListEntryModel(
    progress: -1,
    score: -1.0,
    repeat: -1,
    status: 'ADD TO LIST',
    startedAt: ["~", "~", "~"],
    completedAt: ["~", "~", "~"],
  );

  factory MediaListEntryModel.fromJson(Map<String, dynamic> json) =>
      _$MediaListEntryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$MediaListEntryModelToJson(this as _MediaListEntryModel);
}

class MediaListEntryConverter implements JsonConverter<MediaListEntry, Map<String, dynamic>> {
  const MediaListEntryConverter();

  @override
  MediaListEntry fromJson(Map<String, dynamic> json) => MediaListEntryModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(MediaListEntry object) =>
      (object as MediaListEntryModel).toJson();
}