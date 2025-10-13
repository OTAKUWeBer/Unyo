import 'package:hive_ce/hive.dart';
import 'package:unyo/data/adapters/adapters_names.dart' as names;
import 'package:unyo/data/adapters/adapters_types.dart' as types;

part 'episode_service.g.dart';

@HiveType(typeId: types.episodeServiceAdapterType, adapterName: names.episodeServiceEnumAdapterName)
enum EpisodeService {
  @HiveField(0) anizip,
  @HiveField(1) kitsu
}