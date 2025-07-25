import 'package:unyo/generated/json/base/json_convert_content.dart';
import 'package:unyo/core/services/api/dto/media_collection_recently_released_graphql_dto_entity.dart';

MediaCollectionRecentlyReleasedGraphqlDtoEntity $MediaCollectionRecentlyReleasedGraphqlDtoEntityFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoEntity mediaCollectionRecentlyReleasedGraphqlDtoEntity = MediaCollectionRecentlyReleasedGraphqlDtoEntity();
  final MediaCollectionRecentlyReleasedGraphqlDtoData? data = jsonConvert
      .convert<MediaCollectionRecentlyReleasedGraphqlDtoData>(json['data']);
  if (data != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoEntity.data = data;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoEntity;
}

Map<String, dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoEntityToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoEntityExtension on MediaCollectionRecentlyReleasedGraphqlDtoEntity {
  MediaCollectionRecentlyReleasedGraphqlDtoEntity copyWith({
    MediaCollectionRecentlyReleasedGraphqlDtoData? data,
  }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoEntity()
      ..data = data ?? this.data;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoData $MediaCollectionRecentlyReleasedGraphqlDtoDataFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoData mediaCollectionRecentlyReleasedGraphqlDtoData = MediaCollectionRecentlyReleasedGraphqlDtoData();
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPage? page = jsonConvert
      .convert<MediaCollectionRecentlyReleasedGraphqlDtoDataPage>(json['Page']);
  if (page != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoData.page = page;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoData;
}

Map<String, dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Page'] = entity.page.toJson();
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataExtension on MediaCollectionRecentlyReleasedGraphqlDtoData {
  MediaCollectionRecentlyReleasedGraphqlDtoData copyWith({
    MediaCollectionRecentlyReleasedGraphqlDtoDataPage? page,
  }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoData()
      ..page = page ?? this.page;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoDataPage $MediaCollectionRecentlyReleasedGraphqlDtoDataPageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPage mediaCollectionRecentlyReleasedGraphqlDtoDataPage = MediaCollectionRecentlyReleasedGraphqlDtoDataPage();
  final List<
      MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules>? airingSchedules = (json['airingSchedules'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules>(
          e) as MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules)
      .toList();
  if (airingSchedules != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPage.airingSchedules =
        airingSchedules;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPage;
}

Map<String, dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['airingSchedules'] =
      entity.airingSchedules.map((v) => v.toJson()).toList();
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPage {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPage copyWith({
    List<
        MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules>? airingSchedules,
  }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPage()
      ..airingSchedules = airingSchedules ?? this.airingSchedules;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules = MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules();
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia? media = jsonConvert
      .convert<
      MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia>(
      json['media']);
  if (media != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules.media =
        media;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules;
}

Map<String,
    dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['media'] = entity.media.toJson();
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules copyWith({
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia? media,
  }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules()
      ..media = media ?? this.media;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia = MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia();
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode? nextAiringEpisode = jsonConvert
      .convert<
      MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode>(
      json['nextAiringEpisode']);
  if (nextAiringEpisode != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .nextAiringEpisode = nextAiringEpisode;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .status = status;
  }
  final bool? isFavourite = jsonConvert.convert<bool>(json['isFavourite']);
  if (isFavourite != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .isFavourite = isFavourite;
  }
  final String? season = jsonConvert.convert<String>(json['season']);
  if (season != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .season = season;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia.id =
        id;
  }
  final int? idMal = jsonConvert.convert<int>(json['idMal']);
  if (idMal != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .idMal = idMal;
  }
  final bool? isAdult = jsonConvert.convert<bool>(json['isAdult']);
  if (isAdult != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .isAdult = isAdult;
  }
  final int? meanScore = jsonConvert.convert<int>(json['meanScore']);
  if (meanScore != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .meanScore = meanScore;
  }
  final int? popularity = jsonConvert.convert<int>(json['popularity']);
  if (popularity != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .popularity = popularity;
  }
  final List<String>? genres = (json['genres'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (genres != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .genres = genres;
  }
  final String? format = jsonConvert.convert<String>(json['format']);
  if (format != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .format = format;
  }
  final dynamic episodes = json['episodes'];
  if (episodes != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .episodes = episodes;
  }
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate? endDate = jsonConvert
      .convert<
      MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate>(
      json['endDate']);
  if (endDate != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .endDate = endDate;
  }
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate? startDate = jsonConvert
      .convert<
      MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate>(
      json['startDate']);
  if (startDate != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .startDate = startDate;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .duration = duration;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .description = description;
  }
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage? coverImage = jsonConvert
      .convert<
      MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage>(
      json['coverImage']);
  if (coverImage != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .coverImage = coverImage;
  }
  final String? countryOfOrigin = jsonConvert.convert<String>(
      json['countryOfOrigin']);
  if (countryOfOrigin != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .countryOfOrigin = countryOfOrigin;
  }
  final dynamic chapters = json['chapters'];
  if (chapters != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .chapters = chapters;
  }
  final String? bannerImage = jsonConvert.convert<String>(json['bannerImage']);
  if (bannerImage != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .bannerImage = bannerImage;
  }
  final int? averageScore = jsonConvert.convert<int>(json['averageScore']);
  if (averageScore != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .averageScore = averageScore;
  }
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle? title = jsonConvert
      .convert<
      MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle>(
      json['title']);
  if (title != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia
        .title = title;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia;
}

Map<String,
    dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia entity) {
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

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia copyWith(
      {
        MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode? nextAiringEpisode,
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
        dynamic episodes,
        MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate? endDate,
        MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate? startDate,
        int? duration,
        String? description,
        MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage? coverImage,
        String? countryOfOrigin,
        dynamic chapters,
        String? bannerImage,
        int? averageScore,
        MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle? title,
      }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia()
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

MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisodeFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode = MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode();
  final int? episode = jsonConvert.convert<int>(json['episode']);
  if (episode != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode
        .episode = episode;
  }
  final int? airingAt = jsonConvert.convert<int>(json['airingAt']);
  if (airingAt != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode
        .airingAt = airingAt;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode;
}

Map<String,
    dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisodeToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['episode'] = entity.episode;
  data['airingAt'] = entity.airingAt;
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisodeExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode copyWith(
      {
        int? episode,
        int? airingAt,
      }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode()
      ..episode = episode ?? this.episode
      ..airingAt = airingAt ?? this.airingAt;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate = MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate();
  final dynamic day = json['day'];
  if (day != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate
        .day = day;
  }
  final dynamic month = json['month'];
  if (month != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate
        .month = month;
  }
  final dynamic year = json['year'];
  if (year != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate
        .year = year;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate;
}

Map<String,
    dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDateToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDateExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate copyWith(
      {
        dynamic day,
        dynamic month,
        dynamic year,
      }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDateFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate = MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate();
  final int? day = jsonConvert.convert<int>(json['day']);
  if (day != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate
        .day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate
        .month = month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate
        .year = year;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate;
}

Map<String,
    dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDateToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDateExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate copyWith(
      {
        int? day,
        int? month,
        int? year,
      }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImageFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage = MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage();
  final String? large = jsonConvert.convert<String>(json['large']);
  if (large != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage
        .large = large;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage;
}

Map<String,
    dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImageToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['large'] = entity.large;
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImageExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage copyWith(
      {
        String? large,
      }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage()
      ..large = large ?? this.large;
  }
}

MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitleFromJson(
    Map<String, dynamic> json) {
  final MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle = MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle();
  final dynamic english = json['english'];
  if (english != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle
        .english = english;
  }
  final String? native = jsonConvert.convert<String>(json['native']);
  if (native != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle
        .native = native;
  }
  final String? romaji = jsonConvert.convert<String>(json['romaji']);
  if (romaji != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle
        .romaji = romaji;
  }
  final String? userPreferred = jsonConvert.convert<String>(
      json['userPreferred']);
  if (userPreferred != null) {
    mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle
        .userPreferred = userPreferred;
  }
  return mediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle;
}

Map<String,
    dynamic> $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitleToJson(
    MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['english'] = entity.english;
  data['native'] = entity.native;
  data['romaji'] = entity.romaji;
  data['userPreferred'] = entity.userPreferred;
  return data;
}

extension MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitleExtension on MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle {
  MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle copyWith(
      {
        dynamic english,
        String? native,
        String? romaji,
        String? userPreferred,
      }) {
    return MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle()
      ..english = english ?? this.english
      ..native = native ?? this.native
      ..romaji = romaji ?? this.romaji
      ..userPreferred = userPreferred ?? this.userPreferred;
  }
}