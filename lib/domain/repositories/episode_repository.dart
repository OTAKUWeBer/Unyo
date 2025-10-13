import 'package:unyo/domain/entities/episode_info.dart';

abstract class EpisodeRepository {
  Future<List<EpisodeInfo>> getEpisodeInfo({required int malId, required int anilistId});
  Future<String> getAlternativeImage({required int malId, required int anilistId});
}
