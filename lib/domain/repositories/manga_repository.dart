import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/manga_details.dart';
import 'package:unyo/domain/entities/user.dart';

abstract class MangaRepository {
  Future<(bool, List<Manga>)> getTrendingMangas(int page, User loggedUser);
  Future<(bool, List<Manga>)> getPopularMangas(int page, User loggedUser);
  Future<(bool, List<Manga>)> getRecentlyCompletedMangas(int page, User loggedUser);
  Future<(bool, List<Manga>)> getUpcomingMangas(int page, User loggedUser);
  Future<(bool, MangaDetails)> getMangaDetails(Manga selectedManga, User loggedUser);
  Future<Map<String, (bool, List<String>)>> getUserMangaAdvancedSearchFilters();
  Future<List<Manga>> performMangaAdvancedSearch(
    String query,
    List<String> selectedGenres,
    String? selectedCountryOfOrigin,
    String? selectedFormat,
    int? selectedYear,
    String? selectedPublishingStatus,
    String sort,
    int page,
    User loggedUser
  );
  Future<List<String>> getMediaCoverImages(User loggedUser);
}