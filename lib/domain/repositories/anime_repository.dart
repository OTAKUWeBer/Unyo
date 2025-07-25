import 'package:unyo/domain/entities/anime.dart';

abstract class AnimeRepository {
  Future<(bool, List<Anime>)> getRecentlyReleasedAnimes(int page);
  Future<(bool, List<Anime>)> getTrendingAnimes(int page);
  Future<(bool, List<Anime>)> getPopularAnimes(int page);
  Future<(bool, List<Anime>)> getRecentlyCompletedAnimes(int page);
  Future<(bool, List<Anime>)> getUpcomingAnimes(int page);
}
