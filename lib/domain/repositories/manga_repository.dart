import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/manga_details.dart';
import 'package:unyo/domain/entities/user.dart';

abstract class MangaRepository {
  Future<(bool, List<Manga>)> getTrendingMangas(int page);
  Future<(bool, List<Manga>)> getPopularMangas(int page);
  Future<(bool, List<Manga>)> getRecentlyCompletedMangas(int page);
  Future<(bool, List<Manga>)> getUpcomingMangas(int page);
  Future<(bool, MangaDetails)> getMangaDetails(Manga selectedAnime, User user);
  Future<List<String>> getMediaCoverImages();
}