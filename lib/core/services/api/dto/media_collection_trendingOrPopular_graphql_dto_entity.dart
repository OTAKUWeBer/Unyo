import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/media_collection_trendingOrPopular_graphql_dto_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/media_collection_trendingOrPopular_graphql_dto_entity.g.dart';

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoEntity {
	late MediaCollectionTrendingOrPopularGraphqlDtoData data;

	MediaCollectionTrendingOrPopularGraphqlDtoEntity();

	factory MediaCollectionTrendingOrPopularGraphqlDtoEntity.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoEntityFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoData {
	@JSONField(name: "Page")
	late MediaCollectionTrendingOrPopularGraphqlDtoDataPage page;

	MediaCollectionTrendingOrPopularGraphqlDtoData();

	factory MediaCollectionTrendingOrPopularGraphqlDtoData.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoDataFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoDataPage {
	late List<MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia> media = [];

	MediaCollectionTrendingOrPopularGraphqlDtoDataPage();

	factory MediaCollectionTrendingOrPopularGraphqlDtoDataPage.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia {
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
	late MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate endDate;
	late MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate startDate;
	late int duration = 0;
	late String description = '';
	late MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage coverImage;
	late String countryOfOrigin = '';
	late int? chapters;
	late String bannerImage = '';
	late int averageScore = 0;
	late MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle title;

	MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia();

	factory MediaCollectionTrendingOrPopularGraphqlDtoDataPageMedia.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate();

	factory MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDate.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaEndDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate();

	factory MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDate.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaStartDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage {
	late String large = '';

	MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage();

	factory MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImage.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImageFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaCoverImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle {
	late String english = '';
	late String native = '';
	late String romaji = '';
	late String userPreferred = '';

	MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle();

	factory MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitle.fromJson(Map<String, dynamic> json) => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitleFromJson(json);

	Map<String, dynamic> toJson() => $MediaCollectionTrendingOrPopularGraphqlDtoDataPageMediaTitleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}