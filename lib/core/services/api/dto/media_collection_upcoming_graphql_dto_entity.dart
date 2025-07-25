import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/media_collection_upcoming_graphql_dto_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/media_collection_upcoming_graphql_dto_entity.g.dart';

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoEntity {
	late MediaCollectionUpcomingGraphqlDtoData data;

	MediaCollectionUpcomingGraphqlDtoEntity();

	factory MediaCollectionUpcomingGraphqlDtoEntity.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoEntityFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoData {
	@JSONField(name: "Page")
	late MediaCollectionUpcomingGraphqlDtoDataPage page;

	MediaCollectionUpcomingGraphqlDtoData();

	factory MediaCollectionUpcomingGraphqlDtoData.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoDataPage {
	late List<MediaCollectionUpcomingGraphqlDtoDataPageMedia> media = [];

	MediaCollectionUpcomingGraphqlDtoDataPage();

	factory MediaCollectionUpcomingGraphqlDtoDataPage.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataPageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataPageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoDataPageMedia {
	late MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode nextAiringEpisode;
	late String status = '';
	late bool isFavourite = false;
	late String season = '';
	late int id = 0;
	late int idMal = 0;
	late bool isAdult = false;
	late int meanScore = 0;
	late int popularity = 0;
	late List<String> genres = [];
	late String format = '';
	late int episodes = 0;
	late MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate endDate;
	late MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate startDate;
	late int? duration;
	late String description = '';
	late MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage coverImage;
	late String countryOfOrigin = '';
	late int? chapters;
	late String bannerImage = '';
	late int averageScore = 0;
	late MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle title;

	MediaCollectionUpcomingGraphqlDtoDataPageMedia();

	factory MediaCollectionUpcomingGraphqlDtoDataPageMedia.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataPageMediaFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataPageMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode {
	late int episode = 0;
	late int airingAt = 0;

	MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode();

	factory MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisode.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisodeFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataPageMediaNextAiringEpisodeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate {
	dynamic day;
	dynamic month;
	dynamic year;

	MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate();

	factory MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDate.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataPageMediaEndDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate {
	dynamic day;
	late int month = 0;
	late int year = 0;

	MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate();

	factory MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDate.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataPageMediaStartDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage {
	late String large = '';

	MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage();

	factory MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImage.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataPageMediaCoverImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle {
	late String english = '';
	late String native = '';
	late String romaji = '';
	late String userPreferred = '';

	MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle();

	factory MediaCollectionUpcomingGraphqlDtoDataPageMediaTitle.fromJson(Map<String, dynamic> json) => $MediaCollectionUpcomingGraphqlDtoDataPageMediaTitleFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionUpcomingGraphqlDtoDataPageMediaTitleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}