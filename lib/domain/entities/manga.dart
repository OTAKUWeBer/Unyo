import 'title.dart';

abstract class Manga {
  final int id;
  final int idMal;
  final Title title;
  final int averageScore;
  final String bannerImage;
  final int chapters;
  final String countryOfOrigin;
  final String coverImage;
  final String description;
  final String endDate;
  final String startDate;
  final List<String> genres;
  final String format;
  final bool isAdult;
  final int popularity;
  final int meanScore;
  final bool isFavourite;

  const Manga({
    required this.id,
    required this.idMal,
    required this.title,
    required this.averageScore,
    required this.bannerImage,
    required this.chapters,
    required this.countryOfOrigin,
    required this.coverImage,
    required this.description,
    required this.endDate,
    required this.startDate,
    required this.genres,
    required this.format,
    required this.isAdult,
    required this.popularity,
    required this.meanScore,
    required this.isFavourite,
  });

  @override
  String toString() {
    return 'Manga(id: $id, idMal: $idMal, title: $title, averageScore: $averageScore, bannerImage: $bannerImage, chapters: $chapters, countryOfOrigin: $countryOfOrigin, coverImage: $coverImage, description: $description, endDate: $endDate, startDate: $startDate, genres: $genres, format: $format, isAdult: $isAdult, popularity: $popularity, meanScore: $meanScore, isFavourite: $isFavourite)';
  }
}
