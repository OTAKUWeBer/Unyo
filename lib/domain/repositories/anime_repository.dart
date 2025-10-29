import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/anime_details.dart';
import 'package:unyo/domain/entities/user.dart';

abstract class AnimeRepository {
  Future<(bool, List<Anime>)> getRecentlyReleasedAnimes(int page);
  Future<(bool, List<Anime>)> getTrendingAnimes(int page);
  Future<(bool, List<Anime>)> getPopularAnimes(int page);
  Future<(bool, List<Anime>)> getRecentlyCompletedAnimes(int page);
  Future<(bool, List<Anime>)> getUpcomingAnimes(int page);
  Future<Map<String, List<Anime>>> getCalendarReleases(int page, User user);
  Future<(bool, AnimeDetails)> getAnimeDetails(Anime selectedAnime, User user);
  Future<Map<String, (bool, List<String>)>> getUserAnimeAdvancedSearchFilters();
  Future<List<Anime>> performAnimeAdvancedSearch(String query, List<String> selectedGenres, String? selectedSeason, String? selectedFormat, int? selectedYear, String? selectedAiringStatus, int page);
  Future<List<String>> getMediaCoverImages();
}
