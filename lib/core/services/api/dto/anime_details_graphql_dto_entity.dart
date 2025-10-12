import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/anime_details_graphql_dto_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/anime_details_graphql_dto_entity.g.dart';

@JsonSerializable()
class AnimeDetailsGraphqlDtoEntity {
	late AnimeDetailsGraphqlDtoData data;

	AnimeDetailsGraphqlDtoEntity();

	factory AnimeDetailsGraphqlDtoEntity.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoEntityFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoData {
	@JSONField(name: "MediaList")
	late AnimeDetailsGraphqlDtoDataMediaList mediaList;

	AnimeDetailsGraphqlDtoData();

	factory AnimeDetailsGraphqlDtoData.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaList {
	late int progress = 0;
	late int score = 0;
	late int repeat = 0;
	late AnimeDetailsGraphqlDtoDataMediaListMedia media;

	AnimeDetailsGraphqlDtoDataMediaList();

	factory AnimeDetailsGraphqlDtoDataMediaList.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMedia {
	late AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations recommendations;
	late AnimeDetailsGraphqlDtoDataMediaListMediaCharacters characters;

	AnimeDetailsGraphqlDtoDataMediaListMedia();

	factory AnimeDetailsGraphqlDtoDataMediaListMedia.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations {
	late List<AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes> nodes = [];

	AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaRecommendations.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes {
	late AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation mediaRecommendation;

	AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodes.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation {
	late int id = 0;
	late int idMal = 0;
	late AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate startDate;
	late AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate endDate;
	late String season = '';
	late String status = '';
	late bool isFavourite = false;
	late bool isAdult = false;
	late int episodes = 0;
	late AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle title;
	late String bannerImage = '';
	late AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage coverImage;
	late int averageScore = 0;
	late int duration = 0;
	late String format = '';
	late List<String> genres = [];
	late String description = '';
	late int meanScore = 0;
	dynamic nextAiringEpisode;

	AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendation.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDate.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDateFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationStartDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDate.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDateFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationEndDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle {
	late String english = '';
	late String native = '';
	late String romaji = '';
	late String userPreferred = '';

	AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitle.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitleFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationTitleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage {
	late String large = '';

	AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImage.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImageFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaRecommendationsNodesMediaRecommendationCoverImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaCharacters {
	late List<AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes> nodes = [];

	AnimeDetailsGraphqlDtoDataMediaListMediaCharacters();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaCharacters.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes {
	late int id = 0;
	late AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage image;
	late AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName name;
	late String gender = '';
	late String description = '';
	late AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth dateOfBirth;
	late String age = '';

	AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodes.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage {
	late String large = '';

	AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImage.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImageFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName {
	late String userPreferred = '';

	AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesName.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesNameFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesNameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth {
	dynamic day;
	dynamic month;
	dynamic year;

	AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth();

	factory AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirth.fromJson(Map<String, dynamic> json) => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirthFromJson(json);

	Map<String, dynamic> toJson() => $AnimeDetailsGraphqlDtoDataMediaListMediaCharactersNodesDateOfBirthToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}