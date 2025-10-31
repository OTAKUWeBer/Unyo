import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unyo/core/di/locator.dart';

class AnimeGenresNotifier {
  final BehaviorSubject<String> _animeGenreSubject;
  final _logger = sl<Logger>();

  AnimeGenresNotifier() : _animeGenreSubject = BehaviorSubject.seeded("");

  // Public stream for Cubits to subscribe
  Stream<String> get animeGenreStream => _animeGenreSubject.stream;

  void updateSelectedAnimeGenre(String newAnimeGenre) {
    _logger.d("Anime notifier updated with: $newAnimeGenre");
    _animeGenreSubject.add(newAnimeGenre);
  }

  String get currentSelectedGenres => _animeGenreSubject.value;

  void dispose() => _animeGenreSubject.close();
}