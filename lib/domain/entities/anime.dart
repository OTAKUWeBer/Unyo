import 'airing_episode.dart';
import 'title.dart';

abstract class Anime {
  final int id;
  final int idMal;
  final Title title;
  final int averageScore;
  final String bannerImage;
  final String countryOfOrigin;
  final String coverImage;
  final String description;
  final int duration;
  final String endDate;
  final String startDate;
  final int episodes;
  final List<String> genres;
  final String format;
  final bool isAdult;
  final int popularity;
  final int meanScore;
  final String season;
  final bool isFavourite;
  final AiringEpisode nextAiringEpisode;

  const Anime({
    required this.id,
    required this.idMal,
    required this.title,
    required this.averageScore,
    required this.bannerImage,
    required this.countryOfOrigin,
    required this.coverImage,
    required this.description,
    required this.duration,
    required this.endDate,
    required this.startDate,
    required this.episodes,
    required this.genres,
    required this.format,
    required this.isAdult,
    required this.popularity,
    required this.meanScore,
    required this.season,
    required this.isFavourite,
    required this.nextAiringEpisode,
  });

  @override
  String toString() {
    return 'Anime(id: $id, idMal: $idMal, title: $title, averageScore: $averageScore, bannerImage: $bannerImage, countryOfOrigin: $countryOfOrigin, coverImage: $coverImage, description: $description, duration: $duration, endDate: $endDate, startDate: $startDate, episodes: $episodes, genres: $genres, format: $format, isAdult: $isAdult, popularity: $popularity, meanScore: $meanScore, season: $season, isFavourite: $isFavourite, nextAiringEpisode: $nextAiringEpisode)';
  }
}
