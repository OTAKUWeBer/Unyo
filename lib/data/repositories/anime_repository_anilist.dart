import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/repositories/anime_repository.dart';

class AnimeRepositoryAnilist implements AnimeRepository{
  @override
  Future<List<Anime>> getPopularAnimes(int page) {
    // TODO: implement getPopularAnimes
    throw UnimplementedError();
  }

  @override
  Future<List<Anime>> getRecentlyCompletedAnimes(int page) {
    // TODO: implement getRecentlyCompletedAnimes
    throw UnimplementedError();
  }

  @override
  Future<List<Anime>> getRecentlyUpdatedAnimes(int page) {
    // TODO: implement getRecentlyUpdatedAnimes
    throw UnimplementedError();
  }

  @override
  Future<List<Anime>> getTrendingAnimes(int page) {
    // TODO: implement getTrendingAnimes
    throw UnimplementedError();
  }

  @override
  Future<List<Anime>> getUpcomingAnimes(int page) {
    // TODO: implement getUpcomingAnimes
    throw UnimplementedError();
  }

  @override
  Future<List<Anime>> getAnimeCarouselBanners() {
    // TODO: implement getAnimeCarouselBanners
    throw UnimplementedError();
  }
}