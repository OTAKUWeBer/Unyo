import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/media_collection_recently_released_graphql_dto_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/media_collection_recently_released_graphql_dto_entity.g.dart';

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoEntity {
	late MediaCollectionRecentlyReleasedGraphqlDtoData data;

	MediaCollectionRecentlyReleasedGraphqlDtoEntity();

	factory MediaCollectionRecentlyReleasedGraphqlDtoEntity.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoEntityFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoData {
	@JSONField(name: "Page")
	late MediaCollectionRecentlyReleasedGraphqlDtoDataPage page;

	MediaCollectionRecentlyReleasedGraphqlDtoData();

	factory MediaCollectionRecentlyReleasedGraphqlDtoData.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPage {
	late List<MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules> airingSchedules = [];

	MediaCollectionRecentlyReleasedGraphqlDtoDataPage();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPage.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules {
	late MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia media;

	MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedules.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia {
	late MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode nextAiringEpisode;
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
	dynamic episodes;
	late MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate endDate;
	late MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate startDate;
	late int duration = 0;
	late String description = '';
	late MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage coverImage;
	late String countryOfOrigin = '';
	dynamic chapters;
	late String bannerImage = '';
	late int averageScore = 0;
	late MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle title;

	MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMedia.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode {
	late int episode = 0;
	late int airingAt = 0;

	MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisode.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisodeFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaNextAiringEpisodeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate {
	dynamic day;
	dynamic month;
	dynamic year;

	MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDate.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaEndDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDate.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaStartDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage {
	late String large = '';

	MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImage.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaCoverImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle {
	dynamic english;
	late String native = '';
	late String romaji = '';
	late String userPreferred = '';

	MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle();

	factory MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitle.fromJson(Map<String, dynamic> json) => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitleFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionRecentlyReleasedGraphqlDtoDataPageAiringSchedulesMediaTitleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}