import 'package:hive_ce/hive.dart';
import 'package:unyo/data/adapters/adapters_types.dart' as types;
import 'package:unyo/data/adapters/adapters_names.dart' as names;

part 'service.g.dart';

@HiveType(typeId: types.serviceAdapterType, adapterName: names.serviceEnumAdapterName)
enum Service {
  @HiveField(0) anilist,
  @HiveField(1) mal,
  @HiveField(2) kitsu,
  @HiveField(3) shikimori,
  @HiveField(4) simkl
}