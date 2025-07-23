import 'package:unyo/domain/entities/anime.dart';

abstract class AnimeRepository {
  Future<List<Anime>> getRecentlyUpdatedAnimes(int page);
  Future<List<Anime>> getTrendingAnimes(int page);
  Future<List<Anime>> getPopularAnimes(int page);
  Future<List<Anime>> getRecentlyCompletedAnimes(int page);
  Future<List<Anime>> getUpcomingAnimes(int page);
  Future<List<Anime>> getAnimeCarouselBanners();
}
