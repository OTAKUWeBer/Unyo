import 'package:unyo/generated/json/base/json_convert_content.dart';
import 'package:unyo/core/services/api/dto/media_collection_upcoming_graphql_dto_entity.dart';

MediaCollectionUpcomingGraphqlDtoEntity $MediaCollectionUpcomingGraphqlDtoEntityFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoEntity mediaCollectionUpcomingGraphqlDtoEntity = MediaCollectionUpcomingGraphqlDtoEntity();
  final MediaCollectionUpcomingGraphqlDtoData? data = jsonConvert.convert<
      MediaCollectionUpcomingGraphqlDtoData>(json['data']);
  if (data != null) {
    mediaCollectionUpcomingGraphqlDtoEntity.data = data;
  }
  return mediaCollectionUpcomingGraphqlDtoEntity;
}

Map<String, dynamic> $MediaCollectionUpcomingGraphqlDtoEntityToJson(
    MediaCollectionUpcomingGraphqlDtoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoEntityExtension on MediaCollectionUpcomingGraphqlDtoEntity {
  MediaCollectionUpcomingGraphqlDtoEntity copyWith({
    MediaCollectionUpcomingGraphqlDtoData? data,
  }) {
    return MediaCollectionUpcomingGraphqlDtoEntity()
      ..data = data ?? this.data;
  }
}

MediaCollectionUpcomingGraphqlDtoData $MediaCollectionUpcomingGraphqlDtoDataFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoData mediaCollectionUpcomingGraphqlDtoData = MediaCollectionUpcomingGraphqlDtoData();
  final MediaCollectionUpcomingGraphqlDtoDataPage? page = jsonConvert.convert<
      MediaCollectionUpcomingGraphqlDtoDataPage>(json['Page']);
  if (page != null) {
    mediaCollectionUpcomingGraphqlDtoData.page = page;
  }
  return mediaCollectionUpcomingGraphqlDtoData;
}

Map<String, dynamic> $MediaCollectionUpcomingGraphqlDtoDataToJson(
    MediaCollectionUpcomingGraphqlDtoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Page'] = entity.page.toJson();
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoDataExtension on MediaCollectionUpcomingGraphqlDtoData {
  MediaCollectionUpcomingGraphqlDtoData copyWith({
    MediaCollectionUpcomingGraphqlDtoDataPage? page,
  }) {
    return MediaCollectionUpcomingGraphqlDtoData()
      ..page = page ?? this.page;
  }
}

MediaCollectionUpcomingGraphqlDtoDataPage $MediaCollectionUpcomingGraphqlDtoDataPageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoDataPage mediaCollectionUpcomingGraphqlDtoDataPage = MediaCollectionUpcomingGraphqlDtoDataPage();
  final List<
      MediaCollectionUpcomingGraphqlDtoDataPageMedia>? media = (json['media'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          MediaCollectionUpcomingGraphqlDtoDataPageMedia>(
          e) as MediaCollectionUpcomingGraphqlDtoDataPageMedia).toList();
  if (media != null) {
    mediaCollectionUpcomingGraphqlDtoDataPage.media = media;
  }
  return mediaCollectionUpcomingGraphqlDtoDataPage;
}

Map<String, dynamic> $MediaCollectionUpcomingGraphqlDtoDataPageToJson(
    MediaCollectionUpcomingGraphqlDtoDataPage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['media'] = entity.media.map((v) => v.toJson()).toList();
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoDataPageExtension on MediaCollectionUpcomingGraphqlDtoDataPage {
  MediaCollectionUpcomingGraphqlDtoDataPage copyWith({
    List<MediaCollectionUpcomingGraphqlDtoDataPageMedia>? media,
  }) {
    return MediaCollectionUpcomingGraphqlDtoDataPage()
      ..media = media ?? this.media;
  }
}

MediaCollectionUpcomingGraphqlDtoDataPageMedia $MediaCollectionUpcomingGraphqlDtoDataPageMediaFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoDataPageMedia mediaCollectionUpcomingGraphqlDtoDataPageMedia = MediaCollectionUpcomingGraphqlDtoDataPageMedia();
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode? nextAiringEpisode = jsonConvert
      .convert<MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode>(
      json['nextAiringEpisode']);
  if (nextAiringEpisode != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.nextAiringEpisode =
        nextAiringEpisode;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.status = status;
  }
  final bool? isFavourite = jsonConvert.convert<bool>(json['isFavourite']);
  if (isFavourite != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.isFavourite = isFavourite;
  }
  final String? season = jsonConvert.convert<String>(json['season']);
  if (season != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.season = season;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.id = id;
  }
  final int? idMal = jsonConvert.convert<int>(json['idMal']);
  if (idMal != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.idMal = idMal;
  }
  final bool? isAdult = jsonConvert.convert<bool>(json['isAdult']);
  if (isAdult != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.isAdult = isAdult;
  }
  final int? meanScore = jsonConvert.convert<int>(json['meanScore']);
  if (meanScore != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.meanScore = meanScore;
  }
  final int? popularity = jsonConvert.convert<int>(json['popularity']);
  if (popularity != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.popularity = popularity;
  }
  final List<String>? genres = (json['genres'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (genres != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.genres = genres;
  }
  final String? format = jsonConvert.convert<String>(json['format']);
  if (format != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.format = format;
  }
  final int? episodes = jsonConvert.convert<int>(json['episodes']);
  if (episodes != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.episodes = episodes;
  }
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate? endDate = jsonConvert
      .convert<MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate>(
      json['endDate']);
  if (endDate != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.endDate = endDate;
  }
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate? startDate = jsonConvert
      .convert<MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate>(
      json['startDate']);
  if (startDate != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.startDate = startDate;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.duration = duration;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.description = description;
  }
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage? coverImage = jsonConvert
      .convert<MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage>(
      json['coverImage']);
  if (coverImage != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.coverImage = coverImage;
  }
  final String? countryOfOrigin = jsonConvert.convert<String>(
      json['countryOfOrigin']);
  if (countryOfOrigin != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.countryOfOrigin =
        countryOfOrigin;
  }
  final int? chapters = jsonConvert.convert<int>(json['chapters']);
  if (chapters != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.chapters = chapters;
  }
  final String? bannerImage = jsonConvert.convert<String>(json['bannerImage']);
  if (bannerImage != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.bannerImage = bannerImage;
  }
  final int? averageScore = jsonConvert.convert<int>(json['averageScore']);
  if (averageScore != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.averageScore = averageScore;
  }
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle? title = jsonConvert
      .convert<MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle>(
      json['title']);
  if (title != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMedia.title = title;
  }
  return mediaCollectionUpcomingGraphqlDtoDataPageMedia;
}

Map<String, dynamic> $MediaCollectionUpcomingGraphqlDtoDataPageMediaToJson(
    MediaCollectionUpcomingGraphqlDtoDataPageMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nextAiringEpisode'] = entity.nextAiringEpisode.toJson();
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

extension MediaCollectionUpcomingGraphqlDtoDataPageMediaExtension on MediaCollectionUpcomingGraphqlDtoDataPageMedia {
  MediaCollectionUpcomingGraphqlDtoDataPageMedia copyWith({
    MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode? nextAiringEpisode,
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
    MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate? endDate,
    MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate? startDate,
    int? duration,
    String? description,
    MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage? coverImage,
    String? countryOfOrigin,
    int? chapters,
    String? bannerImage,
    int? averageScore,
    MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle? title,
  }) {
    return MediaCollectionUpcomingGraphqlDtoDataPageMedia()
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

MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode $MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisodeFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode mediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode = MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode();
  final int? episode = jsonConvert.convert<int>(json['episode']);
  if (episode != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode.episode =
        episode;
  }
  final int? airingAt = jsonConvert.convert<int>(json['airingAt']);
  if (airingAt != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode.airingAt =
        airingAt;
  }
  return mediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode;
}

Map<String,
    dynamic> $MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisodeToJson(
    MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['episode'] = entity.episode;
  data['airingAt'] = entity.airingAt;
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisodeExtension on MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode {
  MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode copyWith({
    int? episode,
    int? airingAt,
  }) {
    return MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode()
      ..episode = episode ?? this.episode
      ..airingAt = airingAt ?? this.airingAt;
  }
}

MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate $MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate mediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate = MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate();
  final dynamic day = json['day'];
  if (day != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate.day = day;
  }
  final dynamic month = json['month'];
  if (month != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate.month = month;
  }
  final dynamic year = json['year'];
  if (year != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate.year = year;
  }
  return mediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate;
}

Map<String,
    dynamic> $MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDateToJson(
    MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDateExtension on MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate {
  MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate copyWith({
    dynamic day,
    dynamic month,
    dynamic year,
  }) {
    return MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate $MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate mediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate = MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate();
  final dynamic day = json['day'];
  if (day != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate.day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate.month = month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate.year = year;
  }
  return mediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate;
}

Map<String,
    dynamic> $MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDateToJson(
    MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDateExtension on MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate {
  MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate copyWith({
    dynamic day,
    int? month,
    int? year,
  }) {
    return MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage $MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage mediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage = MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage();
  final String? large = jsonConvert.convert<String>(json['large']);
  if (large != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage.large = large;
  }
  return mediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage;
}

Map<String,
    dynamic> $MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImageToJson(
    MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['large'] = entity.large;
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImageExtension on MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage {
  MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage copyWith({
    String? large,
  }) {
    return MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage()
      ..large = large ?? this.large;
  }
}

MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle $MediaCollectionUpcomingGraphqlDtoDataPageMediaTitleFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle mediaCollectionUpcomingGraphqlDtoDataPageMediaTitle = MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle();
  final String? english = jsonConvert.convert<String>(json['english']);
  if (english != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaTitle.english = english;
  }
  final String? native = jsonConvert.convert<String>(json['native']);
  if (native != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaTitle.native = native;
  }
  final String? romaji = jsonConvert.convert<String>(json['romaji']);
  if (romaji != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaTitle.romaji = romaji;
  }
  final String? userPreferred = jsonConvert.convert<String>(
      json['userPreferred']);
  if (userPreferred != null) {
    mediaCollectionUpcomingGraphqlDtoDataPageMediaTitle.userPreferred =
        userPreferred;
  }
  return mediaCollectionUpcomingGraphqlDtoDataPageMediaTitle;
}

Map<String, dynamic> $MediaCollectionUpcomingGraphqlDtoDataPageMediaTitleToJson(
    MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['english'] = entity.english;
  data['native'] = entity.native;
  data['romaji'] = entity.romaji;
  data['userPreferred'] = entity.userPreferred;
  return data;
}

extension MediaCollectionUpcomingGraphqlDtoDataPageMediaTitleExtension on MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle {
  MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle copyWith({
    String? english,
    String? native,
    String? romaji,
    String? userPreferred,
  }) {
    return MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle()
      ..english = english ?? this.english
      ..native = native ?? this.native
      ..romaji = romaji ?? this.romaji
      ..userPreferred = userPreferred ?? this.userPreferred;
  }
}