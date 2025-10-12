import 'package:unyo/generated/json/base/json_convert_content.dart';
import 'package:unyo/core/services/api/dto/anime_details_graphql_dto_entity.dart';

AnimeDetailsGraphqlDtoEntity $AnimeDetailsGraphqlDtoEntityFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoEntity animeDetailsGraphqlDtoEntity = AnimeDetailsGraphqlDtoEntity();
  final AnimeDetailsGraphqlDtoData? data = jsonConvert.convert<
      AnimeDetailsGraphqlDtoData>(json['data']);
  if (data != null) {
    animeDetailsGraphqlDtoEntity.data = data;
  }
  return animeDetailsGraphqlDtoEntity;
}

Map<String, dynamic> $AnimeDetailsGraphqlDtoEntityToJson(
    AnimeDetailsGraphqlDtoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.toJson();
  return data;
}

extension AnimeDetailsGraphqlDtoEntityExtension on AnimeDetailsGraphqlDtoEntity {
  AnimeDetailsGraphqlDtoEntity copyWith({
    AnimeDetailsGraphqlDtoData? data,
  }) {
    return AnimeDetailsGraphqlDtoEntity()
      ..data = data ?? this.data;
  }
}

AnimeDetailsGraphqlDtoData $AnimeDetailsGraphqlDtoDataFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoData animeDetailsGraphqlDtoData = AnimeDetailsGraphqlDtoData();
  final AnimeDetailsGraphqlDtoDataMediaList? mediaList = jsonConvert.convert<
      AnimeDetailsGraphqlDtoDataMediaList>(json['MediaList']);
  if (mediaList != null) {
    animeDetailsGraphqlDtoData.mediaList = mediaList;
  }
  return animeDetailsGraphqlDtoData;
}

Map<String, dynamic> $AnimeDetailsGraphqlDtoDataToJson(
    AnimeDetailsGraphqlDtoData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['MediaList'] = entity.mediaList.toJson();
  return data;
}

extension AnimeDetailsGraphqlDtoDataExtension on AnimeDetailsGraphqlDtoData {
  AnimeDetailsGraphqlDtoData copyWith({
    AnimeDetailsGraphqlDtoDataMediaList? mediaList,
  }) {
    return AnimeDetailsGraphqlDtoData()
      ..mediaList = mediaList ?? this.mediaList;
  }
}

AnimeDetailsGraphqlDtoDataMediaList $AnimeDetailsGraphqlDtoDataMediaListFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaList animeDetailsGraphqlDtoDataMediaList = AnimeDetailsGraphqlDtoDataMediaList();
  final int? progress = jsonConvert.convert<int>(json['progress']);
  if (progress != null) {
    animeDetailsGraphqlDtoDataMediaList.progress = progress;
  }
  final int? score = jsonConvert.convert<int>(json['score']);
  if (score != null) {
    animeDetailsGraphqlDtoDataMediaList.score = score;
  }
  final int? repeat = jsonConvert.convert<int>(json['repeat']);
  if (repeat != null) {
    animeDetailsGraphqlDtoDataMediaList.repeat = repeat;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMedia? media = jsonConvert.convert<
      AnimeDetailsGraphqlDtoDataMediaListMedia>(json['media']);
  if (media != null) {
    animeDetailsGraphqlDtoDataMediaList.media = media;
  }
  return animeDetailsGraphqlDtoDataMediaList;
}

Map<String, dynamic> $AnimeDetailsGraphqlDtoDataMediaListToJson(
    AnimeDetailsGraphqlDtoDataMediaList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['progress'] = entity.progress;
  data['score'] = entity.score;
  data['repeat'] = entity.repeat;
  data['media'] = entity.media.toJson();
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListExtension on AnimeDetailsGraphqlDtoDataMediaList {
  AnimeDetailsGraphqlDtoDataMediaList copyWith({
    int? progress,
    int? score,
    int? repeat,
    AnimeDetailsGraphqlDtoDataMediaListMedia? media,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaList()
      ..progress = progress ?? this.progress
      ..score = score ?? this.score
      ..repeat = repeat ?? this.repeat
      ..media = media ?? this.media;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMedia $AnimeDetailsGraphqlDtoDataMediaListMediaFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMedia animeDetailsGraphqlDtoDataMediaListMedia = AnimeDetailsGraphqlDtoDataMediaListMedia();
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations? recommendations = jsonConvert
      .convert<AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations>(
      json['recommendations']);
  if (recommendations != null) {
    animeDetailsGraphqlDtoDataMediaListMedia.recommendations = recommendations;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharacters? characters = jsonConvert
      .convert<AnimeDetailsGraphqlDtoDataMediaListMediaCharacters>(
      json['characters']);
  if (characters != null) {
    animeDetailsGraphqlDtoDataMediaListMedia.characters = characters;
  }
  return animeDetailsGraphqlDtoDataMediaListMedia;
}

Map<String, dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaToJson(
    AnimeDetailsGraphqlDtoDataMediaListMedia entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['recommendations'] = entity.recommendations.toJson();
  data['characters'] = entity.characters.toJson();
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaExtension on AnimeDetailsGraphqlDtoDataMediaListMedia {
  AnimeDetailsGraphqlDtoDataMediaListMedia copyWith({
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations? recommendations,
    AnimeDetailsGraphqlDtoDataMediaListMediaCharacters? characters,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMedia()
      ..recommendations = recommendations ?? this.recommendations
      ..characters = characters ?? this.characters;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations animeDetailsGraphqlDtoDataMediaListMediaRecommendations = AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations();
  final List<
      AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes>? nodes = (json['nodes'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes>(
          e) as AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes)
      .toList();
  if (nodes != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendations.nodes = nodes;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaRecommendations;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nodes'] = entity.nodes.map((v) => v.toJson()).toList();
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsExtension on AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations {
  AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations copyWith({
    List<AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes>? nodes,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations()
      ..nodes = nodes ?? this.nodes;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes = AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes();
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation? mediaRecommendation = jsonConvert
      .convert<
      AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation>(
      json['mediaRecommendation']);
  if (mediaRecommendation != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes
        .mediaRecommendation = mediaRecommendation;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mediaRecommendation'] = entity.mediaRecommendation.toJson();
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesExtension on AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes {
  AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes copyWith({
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation? mediaRecommendation,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes()
      ..mediaRecommendation = mediaRecommendation ?? this.mediaRecommendation;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation = AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .id = id;
  }
  final int? idMal = jsonConvert.convert<int>(json['idMal']);
  if (idMal != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .idMal = idMal;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate? startDate = jsonConvert
      .convert<
      AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate>(
      json['startDate']);
  if (startDate != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .startDate = startDate;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate? endDate = jsonConvert
      .convert<
      AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate>(
      json['endDate']);
  if (endDate != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .endDate = endDate;
  }
  final String? season = jsonConvert.convert<String>(json['season']);
  if (season != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .season = season;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .status = status;
  }
  final bool? isFavourite = jsonConvert.convert<bool>(json['isFavourite']);
  if (isFavourite != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .isFavourite = isFavourite;
  }
  final bool? isAdult = jsonConvert.convert<bool>(json['isAdult']);
  if (isAdult != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .isAdult = isAdult;
  }
  final int? episodes = jsonConvert.convert<int>(json['episodes']);
  if (episodes != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .episodes = episodes;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle? title = jsonConvert
      .convert<
      AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle>(
      json['title']);
  if (title != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .title = title;
  }
  final String? bannerImage = jsonConvert.convert<String>(json['bannerImage']);
  if (bannerImage != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .bannerImage = bannerImage;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage? coverImage = jsonConvert
      .convert<
      AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage>(
      json['coverImage']);
  if (coverImage != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .coverImage = coverImage;
  }
  final int? averageScore = jsonConvert.convert<int>(json['averageScore']);
  if (averageScore != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .averageScore = averageScore;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .duration = duration;
  }
  final String? format = jsonConvert.convert<String>(json['format']);
  if (format != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .format = format;
  }
  final List<String>? genres = (json['genres'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (genres != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .genres = genres;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .description = description;
  }
  final int? meanScore = jsonConvert.convert<int>(json['meanScore']);
  if (meanScore != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .meanScore = meanScore;
  }
  final dynamic nextAiringEpisode = json['nextAiringEpisode'];
  if (nextAiringEpisode != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation
        .nextAiringEpisode = nextAiringEpisode;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['idMal'] = entity.idMal;
  data['startDate'] = entity.startDate.toJson();
  data['endDate'] = entity.endDate.toJson();
  data['season'] = entity.season;
  data['status'] = entity.status;
  data['isFavourite'] = entity.isFavourite;
  data['isAdult'] = entity.isAdult;
  data['episodes'] = entity.episodes;
  data['title'] = entity.title.toJson();
  data['bannerImage'] = entity.bannerImage;
  data['coverImage'] = entity.coverImage.toJson();
  data['averageScore'] = entity.averageScore;
  data['duration'] = entity.duration;
  data['format'] = entity.format;
  data['genres'] = entity.genres;
  data['description'] = entity.description;
  data['meanScore'] = entity.meanScore;
  data['nextAiringEpisode'] = entity.nextAiringEpisode;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationExtension on AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation {
  AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation copyWith(
      {
        int? id,
        int? idMal,
        AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate? startDate,
        AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate? endDate,
        String? season,
        String? status,
        bool? isFavourite,
        bool? isAdult,
        int? episodes,
        AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle? title,
        String? bannerImage,
        AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage? coverImage,
        int? averageScore,
        int? duration,
        String? format,
        List<String>? genres,
        String? description,
        int? meanScore,
        dynamic nextAiringEpisode,
      }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation()
      ..id = id ?? this.id
      ..idMal = idMal ?? this.idMal
      ..startDate = startDate ?? this.startDate
      ..endDate = endDate ?? this.endDate
      ..season = season ?? this.season
      ..status = status ?? this.status
      ..isFavourite = isFavourite ?? this.isFavourite
      ..isAdult = isAdult ?? this.isAdult
      ..episodes = episodes ?? this.episodes
      ..title = title ?? this.title
      ..bannerImage = bannerImage ?? this.bannerImage
      ..coverImage = coverImage ?? this.coverImage
      ..averageScore = averageScore ?? this.averageScore
      ..duration = duration ?? this.duration
      ..format = format ?? this.format
      ..genres = genres ?? this.genres
      ..description = description ?? this.description
      ..meanScore = meanScore ?? this.meanScore
      ..nextAiringEpisode = nextAiringEpisode ?? this.nextAiringEpisode;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDateFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate = AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate();
  final int? day = jsonConvert.convert<int>(json['day']);
  if (day != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate
        .day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate
        .month = month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate
        .year = year;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDateToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDateExtension on AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate {
  AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate copyWith(
      {
        int? day,
        int? month,
        int? year,
      }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDateFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate = AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate();
  final int? day = jsonConvert.convert<int>(json['day']);
  if (day != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate
        .day = day;
  }
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate
        .month = month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate
        .year = year;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDateToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDateExtension on AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate {
  AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate copyWith(
      {
        int? day,
        int? month,
        int? year,
      }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitleFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle = AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle();
  final String? english = jsonConvert.convert<String>(json['english']);
  if (english != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle
        .english = english;
  }
  final String? native = jsonConvert.convert<String>(json['native']);
  if (native != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle
        .native = native;
  }
  final String? romaji = jsonConvert.convert<String>(json['romaji']);
  if (romaji != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle
        .romaji = romaji;
  }
  final String? userPreferred = jsonConvert.convert<String>(
      json['userPreferred']);
  if (userPreferred != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle
        .userPreferred = userPreferred;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitleToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['english'] = entity.english;
  data['native'] = entity.native;
  data['romaji'] = entity.romaji;
  data['userPreferred'] = entity.userPreferred;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitleExtension on AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle {
  AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle copyWith(
      {
        String? english,
        String? native,
        String? romaji,
        String? userPreferred,
      }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle()
      ..english = english ?? this.english
      ..native = native ?? this.native
      ..romaji = romaji ?? this.romaji
      ..userPreferred = userPreferred ?? this.userPreferred;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImageFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage = AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage();
  final String? large = jsonConvert.convert<String>(json['large']);
  if (large != null) {
    animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage
        .large = large;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImageToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['large'] = entity.large;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImageExtension on AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage {
  AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage copyWith(
      {
        String? large,
      }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage()
      ..large = large ?? this.large;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaCharacters $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharacters animeDetailsGraphqlDtoDataMediaListMediaCharacters = AnimeDetailsGraphqlDtoDataMediaListMediaCharacters();
  final List<
      AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes>? nodes = (json['nodes'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<
          AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes>(
          e) as AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes)
      .toList();
  if (nodes != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharacters.nodes = nodes;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaCharacters;
}

Map<String, dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaCharacters entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nodes'] = entity.nodes.map((v) => v.toJson()).toList();
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaCharactersExtension on AnimeDetailsGraphqlDtoDataMediaListMediaCharacters {
  AnimeDetailsGraphqlDtoDataMediaListMediaCharacters copyWith({
    List<AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes>? nodes,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaCharacters()
      ..nodes = nodes ?? this.nodes;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes = AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.id = id;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage? image = jsonConvert
      .convert<AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage>(
      json['image']);
  if (image != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.image = image;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName? name = jsonConvert
      .convert<AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName>(
      json['name']);
  if (name != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.name = name;
  }
  final String? gender = jsonConvert.convert<String>(json['gender']);
  if (gender != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.gender = gender;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.description =
        description;
  }
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth? dateOfBirth = jsonConvert
      .convert<
      AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth>(
      json['dateOfBirth']);
  if (dateOfBirth != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.dateOfBirth =
        dateOfBirth;
  }
  final String? age = jsonConvert.convert<String>(json['age']);
  if (age != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.age = age;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaCharactersNodes;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image'] = entity.image.toJson();
  data['name'] = entity.name.toJson();
  data['gender'] = entity.gender;
  data['description'] = entity.description;
  data['dateOfBirth'] = entity.dateOfBirth.toJson();
  data['age'] = entity.age;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesExtension on AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes {
  AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes copyWith({
    int? id,
    AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage? image,
    AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName? name,
    String? gender,
    String? description,
    AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth? dateOfBirth,
    String? age,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes()
      ..id = id ?? this.id
      ..image = image ?? this.image
      ..name = name ?? this.name
      ..gender = gender ?? this.gender
      ..description = description ?? this.description
      ..dateOfBirth = dateOfBirth ?? this.dateOfBirth
      ..age = age ?? this.age;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImageFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage = AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage();
  final String? large = jsonConvert.convert<String>(json['large']);
  if (large != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage.large = large;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImageToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['large'] = entity.large;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImageExtension on AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage {
  AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage copyWith({
    String? large,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage()
      ..large = large ?? this.large;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesNameFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName = AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName();
  final String? userPreferred = jsonConvert.convert<String>(
      json['userPreferred']);
  if (userPreferred != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName.userPreferred =
        userPreferred;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesNameToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userPreferred'] = entity.userPreferred;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesNameExtension on AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName {
  AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName copyWith({
    String? userPreferred,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName()
      ..userPreferred = userPreferred ?? this.userPreferred;
  }
}

AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirthFromJson(
    Map<String, dynamic> json) {
  final AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth = AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth();
  final dynamic day = json['day'];
  if (day != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth.day =
        day;
  }
  final dynamic month = json['month'];
  if (month != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth.month =
        month;
  }
  final dynamic year = json['year'];
  if (year != null) {
    animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth.year =
        year;
  }
  return animeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth;
}

Map<String,
    dynamic> $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirthToJson(
    AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['day'] = entity.day;
  data['month'] = entity.month;
  data['year'] = entity.year;
  return data;
}

extension AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirthExtension on AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth {
  AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth copyWith({
    dynamic day,
    dynamic month,
    dynamic year,
  }) {
    return AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth()
      ..day = day ?? this.day
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}