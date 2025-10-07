import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:unyo/data/adapters/adapters_names.dart' as names;
import 'package:unyo/data/adapters/adapters_types.dart' as types;

part 'anime_progress.freezed.dart';
part 'anime_progress.g.dart';

abstract class AnimeProgress {
  final int progress;
  final int score;
  final int repeat;

  const AnimeProgress({required this.progress, required this.score, required this.repeat});
}

@freezed
@HiveType(typeId: types.animeProgressAdapterType, adapterName: names.animeProgressModelAdapterName)
abstract class AnimeProgressModel with _$AnimeProgressModel implements AnimeProgress {
  const factory AnimeProgressModel({
    @HiveField(0) required int progress,
    @HiveField(1) required int score,
    @HiveField(2) required int repeat,
  }) = _AnimeProgressModel;

  factory AnimeProgressModel.empty() => const AnimeProgressModel(
      progress: 0,
      score: 0,
      repeat: 0
  );

  factory AnimeProgressModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeProgressModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AnimeProgressModelToJson(this as _AnimeProgressModel);
}

class AnimeProgresConverter implements JsonConverter<AnimeProgress, Map<String, dynamic>> {
  const AnimeProgresConverter();

  @override
  AnimeProgress fromJson(Map<String, dynamic> json) => AnimeProgressModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(AnimeProgress object) =>
      (object as AnimeProgressModel).toJson();
}
