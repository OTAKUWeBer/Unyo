import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/media_collection_recently_completed_graphql_dto_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/media_collection_recently_completed_graphql_dto_entity.g.dart';

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoEntity {
	late MediaCollectionRecentlyCompletedGraphqlDtoData data;

	MediaCollectionRecentlyCompletedGraphqlDtoEntity();

	factory MediaCollectionRecentlyCompletedGraphqlDtoEntity.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoEntityFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoData {
	@JSONField(name: "Page")
	late MediaCollectionRecentlyCompletedGraphqlDtoDataPage page;

	MediaCollectionRecentlyCompletedGraphqlDtoData();

	factory MediaCollectionRecentlyCompletedGraphqlDtoData.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoDataFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoDataPage {
	late List<MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia> media = [];

	MediaCollectionRecentlyCompletedGraphqlDtoDataPage();

	factory MediaCollectionRecentlyCompletedGraphqlDtoDataPage.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia {
	dynamic nextAiringEpisode;
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
	late MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate endDate;
	late MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate startDate;
	late int duration = 0;
	late String description = '';
	late MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage coverImage;
	late String countryOfOrigin = '';
	late int chapters = 0;
	late String bannerImage = '';
	late int averageScore = 0;
	late MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle title;

	MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia();

	factory MediaCollectionRecentlyCompletedGraphqlDtoDataPageMedia.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate();

	factory MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDate.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaEndDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate();

	factory MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDate.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaStartDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage {
	late String large = '';

	MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage();

	factory MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImage.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaCoverImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle {
	late String english = '';
	late String native = '';
	late String romaji = '';
	late String userPreferred = '';

	MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle();

	factory MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitle.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitleFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyCompletedGraphqlDtoDataPageMediaTitleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}