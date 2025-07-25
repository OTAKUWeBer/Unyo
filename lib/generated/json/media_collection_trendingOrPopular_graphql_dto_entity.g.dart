import 'package:unyo/generated/json/base/json_convert_content.dart';
import 'package:unyo/core/services/api/dto/media_collection_trendingOrPopular_graphql_dto_entity.dart';

MediaCollectionTrendingOrPopularGraphqlDtoEntity $MediaCollectionTrendingOrPopularGraphqlDtoEntityFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoEntity mediaCollectionTrendingOrPopularGraphqlDtoEntity = MediaCollectionTrendingOrPopularGraphqlDtoEntity();
  final MediaCollectionTrendingOrPopularGraphqlDtoData? data = jsonConvert
      .convert<MediaCollectionTrendingOrPopularGraphqlDtoData>(json['data']);
  if (data != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoEntity.data = data;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoEntity;
}

Map<String, dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoEntityToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoEntityExtension on MediaCollectionTrendingOrPopularGraphqlDtoEntity {
  MediaCollectionTrendingOrPopularGraphqlDtoEntity copyWith({
    MediaCollectionTrendingOrPopularGraphqlDtoData? data,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoEntity()
      ..data = data ?? this.data;
  }
}

MediaCollectionTrendingOrPopularGraphqlDtoData $MediaCollectionTrendingOrPopularGraphqlDtoDataFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoData mediaCollectionTrendingOrPopularGraphqlDtoData = MediaCollectionTrendingOrPopularGraphqlDtoData();
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPage? page = jsonConvert
      .convert<MediaCollectionTrendingOrPopularGraphqlDtoDataPage>(
      json['Page']);
  if (page != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoData.page = page;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoData;
}

Map<String, dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoDataToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Page'] = entity.page.toJson();
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoDataExtension on MediaCollectionTrendingOrPopularGraphqlDtoData {
  MediaCollectionTrendingOrPopularGraphqlDtoData copyWith({
    MediaCollectionTrendingOrPopularGraphqlDtoDataPage? page,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoData()
      ..page = page ?? this.page;
  }
}

MediaCollectionTrendingOrPopularGraphqlDtoDataPage $MediaCollectionTrendingOrPopularGraphqlDtoDataPageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPage mediaCollectionTrendingOrPopularGraphqlDtoDataPage = MediaCollectionTrendingOrPopularGraphqlDtoDataPage();
  final List<
      MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia>? media = (json['media'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia>(
          e) as MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia)
      .toList();
  if (media != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPage.media = media;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoDataPage;
}

Map<String, dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoDataPageToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoDataPage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['media'] = entity.media.map((v) => v.toJson()).toList();
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoDataPageExtension on MediaCollectionTrendingOrPopularGraphqlDtoDataPage {
  MediaCollectionTrendingOrPopularGraphqlDtoDataPage copyWith({
    List<MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia>? media,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoDataPage()
      ..media = media ?? this.media;
  }
}

MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia = MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia();
  final dynamic nextAiringEpisode = json['nextAiringEpisode'];
  if (nextAiringEpisode != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.nextAiringEpisode =
        nextAiringEpisode;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.status = status;
  }
  final bool? isFavourite = jsonConvert.convert<bool>(json['isFavourite']);
  if (isFavourite != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.isFavourite =
        isFavourite;
  }
  final String? season = jsonConvert.convert<String>(json['season']);
  if (season != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.season = season;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.id = id;
  }
  final int? idMal = jsonConvert.convert<int>(json['idMal']);
  if (idMal != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.idMal = idMal;
  }
  final bool? isAdult = jsonConvert.convert<bool>(json['isAdult']);
  if (isAdult != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.isAdult = isAdult;
  }
  final int? meanScore = jsonConvert.convert<int>(json['meanScore']);
  if (meanScore != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.meanScore =
        meanScore;
  }
  final int? popularity = jsonConvert.convert<int>(json['popularity']);
  if (popularity != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.popularity =
        popularity;
  }
  final List<String>? genres = (json['genres'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (genres != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.genres = genres;
  }
  final String? format = jsonConvert.convert<String>(json['format']);
  if (format != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.format = format;
  }
  final int? episodes = jsonConvert.convert<int>(json['episodes']);
  if (episodes != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.episodes = episodes;
  }
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate? endDate = jsonConvert
      .convert<MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate>(
      json['endDate']);
  if (endDate != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.endDate = endDate;
  }
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate? startDate = jsonConvert
      .convert<
      MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate>(
      json['startDate']);
  if (startDate != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.startDate =
        startDate;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.duration = duration;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.description =
        description;
  }
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage? coverImage = jsonConvert
      .convert<
      MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage>(
      json['coverImage']);
  if (coverImage != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.coverImage =
        coverImage;
  }
  final String? countryOfOrigin = jsonConvert.convert<String>(
      json['countryOfOrigin']);
  if (countryOfOrigin != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.countryOfOrigin =
        countryOfOrigin;
  }
  final int? chapters = jsonConvert.convert<int>(json['chapters']);
  if (chapters != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.chapters = chapters;
  }
  final String? bannerImage = jsonConvert.convert<String>(json['bannerImage']);
  if (bannerImage != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.bannerImage =
        bannerImage;
  }
  final int? averageScore = jsonConvert.convert<int>(json['averageScore']);
  if (averageScore != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.averageScore =
        averageScore;
  }
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle? title = jsonConvert
      .convert<MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle>(
      json['title']);
  if (title != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.title = title;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia;
}

Map<String,
    dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nextAiringEpisode'] = entity.nextAiringEpisode;
  data['status'] = entity.status;
  data['isFavourite'] = entity.isFavourite;
  data['season'] = entity.season;
  data['id'] = entity.id;
  data['idMal'] = entity.idMal;
  data['isAdult'] = entity.isAdult;
  data['meanScore'] = entity.meanScore;
  data['popularity'] = entity.popularity;
  data['genres'] = entity.genres;
  data['format'] = entity.format;
  data['episodes'] = entity.episodes;
  data['endDate'] = entity.endDate.toJson();
  data['startDate'] = entity.startDate.toJson();
  data['duration'] = entity.duration;
  data['description'] = entity.description;
  data['coverImage'] = entity.coverImage.toJson();
  data['countryOfOrigin'] = entity.countryOfOrigin;
  data['chapters'] = entity.chapters;
  data['bannerImage'] = entity.bannerImage;
  data['averageScore'] = entity.averageScore;
  data['title'] = entity.title.toJson();
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaExtension on MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia {
  MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia copyWith({
    dynamic nextAiringEpisode,
    String? status,
    bool? isFavourite,
    String? season,
    int? id,
    int? idMal,
    bool? isAdult,
    int? meanScore,
    int? popularity,
    List<String>? genres,
    String? format,
    int? episodes,
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate? endDate,
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate? startDate,
    int? duration,
    String? description,
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage? coverImage,
    String? countryOfOrigin,
    int? chapters,
    String? bannerImage,
    int? averageScore,
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle? title,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia()
      ..nextAiringEpisode = nextAiringEpisode ?? this.nextAiringEpisode
      ..status = status ?? this.status
      ..isFavourite = isFavourite ?? this.isFavourite
      ..season = season ?? this.season
      ..id = id ?? this.id
      ..idMal = idMal ?? this.idMal
      ..isAdult = isAdult ?? this.isAdult
      ..meanScore = meanScore ?? this.meanScore
      ..popularity = popularity ?? this.popularity
      ..genres = genres ?? this.genres
      ..format = format ?? this.format
      ..episodes = episodes ?? this.episodes
      ..endDate = endDate ?? this.endDate
      ..startDate = startDate ?? this.startDate
      ..duration = duration ?? this.duration
      ..description = description ?? this.description
      ..coverImage = coverImage ?? this.coverImage
      ..countryOfOrigin = countryOfOrigin ?? this.countryOfOrigin
      ..chapters = chapters ?? this.chapters
      ..bannerImage = bannerImage ?? this.bannerImage
      ..averageScore = averageScore ?? this.averageScore
      ..title = title ?? this.title;
  }
}

MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate = MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate();
  final int? day = jsonConvert.convert<int>(json['day']);
  if (day != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate.day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate.month =
        month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate.year = year;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate;
}

Map<String,
    dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDateToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDateExtension on MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate {
  MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate copyWith({
    int? day,
    int? month,
    int? year,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate = MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate();
  final int? day = jsonConvert.convert<int>(json['day']);
  if (day != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate.day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate.month =
        month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate.year =
        year;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate;
}

Map<String,
    dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDateToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDateExtension on MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate {
  MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate copyWith({
    int? day,
    int? month,
    int? year,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage = MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage();
  final String? large = jsonConvert.convert<String>(json['large']);
  if (large != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage.large =
        large;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage;
}

Map<String,
    dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImageToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['large'] = entity.large;
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImageExtension on MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage {
  MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage copyWith({
    String? large,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage()
      ..large = large ?? this.large;
  }
}

MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitleFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle = MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle();
  final String? english = jsonConvert.convert<String>(json['english']);
  if (english != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle.english =
        english;
  }
  final String? native = jsonConvert.convert<String>(json['native']);
  if (native != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle.native =
        native;
  }
  final String? romaji = jsonConvert.convert<String>(json['romaji']);
  if (romaji != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle.romaji =
        romaji;
  }
  final String? userPreferred = jsonConvert.convert<String>(
      json['userPreferred']);
  if (userPreferred != null) {
    mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle.userPreferred =
        userPreferred;
  }
  return mediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle;
}

Map<String,
    dynamic> $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitleToJson(
    MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['english'] = entity.english;
  data['native'] = entity.native;
  data['romaji'] = entity.romaji;
  data['userPreferred'] = entity.userPreferred;
  return data;
}

extension MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitleExtension on MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle {
  MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle copyWith({
    String? english,
    String? native,
    String? romaji,
    String? userPreferred,
  }) {
    return MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle()
      ..english = english ?? this.english
      ..native = native ?? this.native
      ..romaji = romaji ?? this.romaji
      ..userPreferred = userPreferred ?? this.userPreferred;
  }
}