import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unyo/core/di/locator.dart';

class MangaGenresNotifier {
  final BehaviorSubject<String> _mangaGenreSubject;
  final _logger = sl<Logger>();

  MangaGenresNotifier() : _mangaGenreSubject = BehaviorSubject.seeded("");

  // Public stream for Cubits to subscribe
  Stream<String> get mangaGenreStream => _mangaGenreSubject.stream;

  void updateSelectedMangaGenre(String newMangaGenre) {
    _logger.d("Manga notifier updated with: $newMangaGenre");
    _mangaGenreSubject.add(newMangaGenre);
  }

  String get currentSelectedGenres => _mangaGenreSubject.value;

  void dispose() => _mangaGenreSubject.close();
}