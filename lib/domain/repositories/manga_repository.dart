import 'package:unyo/domain/entities/manga.dart';

abstract class MangaRepository {
  Future<List<Manga>> getTrendingMangas(int page);
  Future<List<Manga>> getLatestMangas(int page);
  Future<List<Manga>> getPopularMangas(int page);
  Future<List<Manga>> getMangaCarouselBanners();
}