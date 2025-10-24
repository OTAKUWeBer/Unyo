import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/media_details_graphql_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/media_details_graphql_entity.g.dart';

@JsonSerializable()
class MediaDetailsGraphqlEntity {
	@JSONField(name: "Media")
	late MediaDetailsGraphqlMedia media;

	MediaDetailsGraphqlEntity();

	factory MediaDetailsGraphqlEntity.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlEntityFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMedia {
	late int id = 0;
	late MediaDetailsGraphqlMediaTitle title;
	late MediaDetailsGraphqlMediaRecommendations recommendations;
	late MediaDetailsGraphqlMediaCharacters characters;
	dynamic mediaListEntry;

	MediaDetailsGraphqlMedia();

	factory MediaDetailsGraphqlMedia.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaTitle {
	late String english = '';
	late String romaji = '';
	late String native = '';
	late String userPreferred = '';

	MediaDetailsGraphqlMediaTitle();

	factory MediaDetailsGraphqlMediaTitle.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaTitleFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaTitleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaRecommendations {
	late List<MediaDetailsGraphqlMediaRecommendationsNodes> nodes = [];

	MediaDetailsGraphqlMediaRecommendations();

	factory MediaDetailsGraphqlMediaRecommendations.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaRecommendationsFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaRecommendationsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaRecommendationsNodes {
	late MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendation mediaRecommendation;

	MediaDetailsGraphqlMediaRecommendationsNodes();

	factory MediaDetailsGraphqlMediaRecommendationsNodes.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaRecommendationsNodesFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaRecommendationsNodesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendation {
	late int id = 0;
	late int idMal = 0;
	late MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationStartDate startDate;
	late MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationEndDate endDate;
	late String season = '';
	late String status = '';
	late bool isFavourite = false;
	late bool isAdult = false;
	late int episodes = 0;
  late int chapters = 0;
	late MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationTitle title;
	late String bannerImage = '';
	late MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationCoverImage coverImage;
	late int averageScore = 0;
	late int duration = 0;
	late String format = '';
	late List<String> genres = [];
	late String description = '';
	late int meanScore = 0;
	dynamic nextAiringEpisode;

	MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendation();

	factory MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendation.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationStartDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationStartDate();

	factory MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationStartDate.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationStartDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationStartDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationEndDate {
	late int day = 0;
	late int month = 0;
	late int year = 0;

	MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationEndDate();

	factory MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationEndDate.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationEndDateFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationEndDateToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationTitle {
	late String english = '';
	late String native = '';
	late String romaji = '';
	late String userPreferred = '';

	MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationTitle();

	factory MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationTitle.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationTitleFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationTitleToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationCoverImage {
	late String large = '';

	MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationCoverImage();

	factory MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationCoverImage.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationCoverImageFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaRecommendationsNodesMediaRecommendationCoverImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaCharacters {
	late List<MediaDetailsGraphqlMediaCharactersNodes> nodes = [];

	MediaDetailsGraphqlMediaCharacters();

	factory MediaDetailsGraphqlMediaCharacters.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaCharactersFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaCharactersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaCharactersNodes {
	late int id = 0;
	late MediaDetailsGraphqlMediaCharactersNodesImage image;
	late MediaDetailsGraphqlMediaCharactersNodesName name;
	late String gender = '';
	late String description = '';
	late MediaDetailsGraphqlMediaCharactersNodesDateOfBirth dateOfBirth;
	late String age = '';

	MediaDetailsGraphqlMediaCharactersNodes();

	factory MediaDetailsGraphqlMediaCharactersNodes.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaCharactersNodesFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaCharactersNodesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaCharactersNodesImage {
	late String large = '';

	MediaDetailsGraphqlMediaCharactersNodesImage();

	factory MediaDetailsGraphqlMediaCharactersNodesImage.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaCharactersNodesImageFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaCharactersNodesImageToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaCharactersNodesName {
	late String userPreferred = '';

	MediaDetailsGraphqlMediaCharactersNodesName();

	factory MediaDetailsGraphqlMediaCharactersNodesName.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaCharactersNodesNameFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaCharactersNodesNameToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MediaDetailsGraphqlMediaCharactersNodesDateOfBirth {
	late int day = 0;
	late int month = 0;
	dynamic year;

	MediaDetailsGraphqlMediaCharactersNodesDateOfBirth();

	factory MediaDetailsGraphqlMediaCharactersNodesDateOfBirth.fromJson(Map<String, dynamic> json) => $MediaDetailsGraphqlMediaCharactersNodesDateOfBirthFromJson(json);

	Map<String, dynamic> toJson() => $MediaDetailsGraphqlMediaCharactersNodesDateOfBirthToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}