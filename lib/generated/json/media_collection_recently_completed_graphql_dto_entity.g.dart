import 'package:unyo/generated/json/base/json_convert_content.dart';
import 'package:unyo/core/services/api/dto/media_collection_recently_completed_graphql_dto_entity.dart';

MediaCollectionRecentlyCompletedGraphqlDtoEntity $MediaCollectionRecentlyCompletedGraphqlDtoEntityFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoEntity mediaCollectionRecentlyCompletedGraphqlDtoEntity = MediaCollectionRecentlyCompletedGraphqlDtoEntity();
  final MediaCollectionRecentlyCompletedGraphqlDtoData? data = jsonConvert
      .convert<MediaCollectionRecentlyCompletedGraphqlDtoData>(json['data']);
  if (data != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoEntity.data = data;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoEntity;
}

Map<String, dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoEntityToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  return data;
}

extension MediaCollectionRecentlyCompletedGraphqlDtoEntityExtension on MediaCollectionRecentlyCompletedGraphqlDtoEntity {
  MediaCollectionRecentlyCompletedGraphqlDtoEntity copyWith({
    MediaCollectionRecentlyCompletedGraphqlDtoData? data,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoEntity()
      ..data = data ?? this.data;
  }
}

MediaCollectionRecentlyCompletedGraphqlDtoData $MediaCollectionRecentlyCompletedGraphqlDtoDataFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoData mediaCollectionRecentlyCompletedGraphqlDtoData = MediaCollectionRecentlyCompletedGraphqlDtoData();
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPage? page = jsonConvert
      .convert<MediaCollectionRecentlyCompletedGraphqlDtoDataPage>(
      json['Page']);
  if (page != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoData.page = page;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoData;
}

Map<String, dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoDataToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Page'] = entity.page.toJson();
  return data;
}

extension MediaCollectionRecentlyCompletedGraphqlDtoDataExtension on MediaCollectionRecentlyCompletedGraphqlDtoData {
  MediaCollectionRecentlyCompletedGraphqlDtoData copyWith({
    MediaCollectionRecentlyCompletedGraphqlDtoDataPage? page,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoData()
      ..page = page ?? this.page;
  }
}

MediaCollectionRecentlyCompletedGraphqlDtoDataPage $MediaCollectionRecentlyCompletedGraphqlDtoDataPageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPage mediaCollectionRecentlyCompletedGraphqlDtoDataPage = MediaCollectionRecentlyCompletedGraphqlDtoDataPage();
  final List<
      MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia>? media = (json['media'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia>(
          e) as MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia)
      .toList();
  if (media != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPage.media = media;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoDataPage;
}

Map<String, dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoDataPageToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoDataPage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['media'] = entity.media.map((v) => v.toJson()).toList();
  return data;
}

extension MediaCollectionRecentlyCompletedGraphqlDtoDataPageExtension on MediaCollectionRecentlyCompletedGraphqlDtoDataPage {
  MediaCollectionRecentlyCompletedGraphqlDtoDataPage copyWith({
    List<MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia>? media,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoDataPage()
      ..media = media ?? this.media;
  }
}

MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia = MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia();
  final dynamic nextAiringEpisode = json['nextAiringEpisode'];
  if (nextAiringEpisode != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.nextAiringEpisode =
        nextAiringEpisode;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.status = status;
  }
  final bool? isFavourite = jsonConvert.convert<bool>(json['isFavourite']);
  if (isFavourite != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.isFavourite =
        isFavourite;
  }
  final String? season = jsonConvert.convert<String>(json['season']);
  if (season != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.season = season;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.id = id;
  }
  final int? idMal = jsonConvert.convert<int>(json['idMal']);
  if (idMal != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.idMal = idMal;
  }
  final bool? isAdult = jsonConvert.convert<bool>(json['isAdult']);
  if (isAdult != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.isAdult = isAdult;
  }
  final int? meanScore = jsonConvert.convert<int>(json['meanScore']);
  if (meanScore != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.meanScore =
        meanScore;
  }
  final int? popularity = jsonConvert.convert<int>(json['popularity']);
  if (popularity != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.popularity =
        popularity;
  }
  final List<String>? genres = (json['genres'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (genres != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.genres = genres;
  }
  final String? format = jsonConvert.convert<String>(json['format']);
  if (format != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.format = format;
  }
  final int? episodes = jsonConvert.convert<int>(json['episodes']);
  if (episodes != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.episodes = episodes;
  }
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate? endDate = jsonConvert
      .convert<MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate>(
      json['endDate']);
  if (endDate != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.endDate = endDate;
  }
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate? startDate = jsonConvert
      .convert<
      MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate>(
      json['startDate']);
  if (startDate != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.startDate =
        startDate;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.duration = duration;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.description =
        description;
  }
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage? coverImage = jsonConvert
      .convert<
      MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage>(
      json['coverImage']);
  if (coverImage != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.coverImage =
        coverImage;
  }
  final String? countryOfOrigin = jsonConvert.convert<String>(
      json['countryOfOrigin']);
  if (countryOfOrigin != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.countryOfOrigin =
        countryOfOrigin;
  }
  final int? chapters = jsonConvert.convert<int>(json['chapters']);
  if (chapters != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.chapters = chapters;
  }
  final String? bannerImage = jsonConvert.convert<String>(json['bannerImage']);
  if (bannerImage != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.bannerImage =
        bannerImage;
  }
  final int? averageScore = jsonConvert.convert<int>(json['averageScore']);
  if (averageScore != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.averageScore =
        averageScore;
  }
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle? title = jsonConvert
      .convert<MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle>(
      json['title']);
  if (title != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.title = title;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia;
}

Map<String,
    dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia entity) {
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

extension MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaExtension on MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia {
  MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia copyWith({
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
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate? endDate,
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate? startDate,
    int? duration,
    String? description,
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage? coverImage,
    String? countryOfOrigin,
    int? chapters,
    String? bannerImage,
    int? averageScore,
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle? title,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia()
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

MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate = MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate();
  final int? day = jsonConvert.convert<int>(json['day']);
  if (day != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate.day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate.month =
        month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate.year = year;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate;
}

Map<String,
    dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDateToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDateExtension on MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate {
  MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate copyWith({
    int? day,
    int? month,
    int? year,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate = MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate();
  final int? day = jsonConvert.convert<int>(json['day']);
  if (day != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate.day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate.month =
        month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate.year =
        year;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate;
}

Map<String,
    dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDateToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDateExtension on MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate {
  MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate copyWith({
    int? day,
    int? month,
    int? year,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage = MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage();
  final String? large = jsonConvert.convert<String>(json['large']);
  if (large != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage.large =
        large;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage;
}

Map<String,
    dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImageToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['large'] = entity.large;
  return data;
}

extension MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImageExtension on MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage {
  MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage copyWith({
    String? large,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage()
      ..large = large ?? this.large;
  }
}

MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitleFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle = MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle();
  final String? english = jsonConvert.convert<String>(json['english']);
  if (english != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle.english =
        english;
  }
  final String? native = jsonConvert.convert<String>(json['native']);
  if (native != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle.native =
        native;
  }
  final String? romaji = jsonConvert.convert<String>(json['romaji']);
  if (romaji != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle.romaji =
        romaji;
  }
  final String? userPreferred = jsonConvert.convert<String>(
      json['userPreferred']);
  if (userPreferred != null) {
    mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle.userPreferred =
        userPreferred;
  }
  return mediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle;
}

Map<String,
    dynamic> $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitleToJson(
    MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['english'] = entity.english;
  data['native'] = entity.native;
  data['romaji'] = entity.romaji;
  data['userPreferred'] = entity.userPreferred;
  return data;
}

extension MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitleExtension on MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle {
  MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle copyWith({
    String? english,
    String? native,
    String? romaji,
    String? userPreferred,
  }) {
    return MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle()
      ..english = english ?? this.english
      ..native = native ?? this.native
      ..romaji = romaji ?? this.romaji
      ..userPreferred = userPreferred ?? this.userPreferred;
  }
}