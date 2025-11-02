import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/manga_details.dart';
import 'package:unyo/domain/entities/user.dart';

abstract class MangaRepository {
  Future<(bool, List<Manga>)> getTrendingMangas(int page);
  Future<(bool, List<Manga>)> getPopularMangas(int page);
  Future<(bool, List<Manga>)> getRecentlyCompletedMangas(int page);
  Future<(bool, List<Manga>)> getUpcomingMangas(int page);
  Future<(bool, MangaDetails)> getMangaDetails(Manga selectedManga, User user);
  Future<Map<String, (bool, List<String>)>> getUserMangaAdvancedSearchFilters();
  Future<List<Manga>> performMangaAdvancedSearch(String query, List<String> selectedGenres, String? selectedSeason, String? selectedFormat, int? selectedYear, String? selectedAiringStatus, String sort, int page);
  Future<List<String>> getMediaCoverImages();
}