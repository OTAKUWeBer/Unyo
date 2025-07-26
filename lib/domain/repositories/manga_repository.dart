import 'package:unyo/domain/entities/manga.dart';

abstract class MangaRepository {
  Future<(bool, List<Manga>)> getTrendingMangas(int page);
  Future<(bool, List<Manga>)> getPopularMangas(int page);
  Future<(bool, List<Manga>)> getRecentlyCompletedMangas(int page);
  Future<(bool, List<Manga>)> getUpcomingMangas(int page);
}