import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/viewer_graphql_dto_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/viewer_graphql_dto_entity.g.dart';

@JsonSerializable()
class ViewerGraphqlDtoEntity {
	@JSONField(name: "Viewer")
	late ViewerGraphqlDtoViewer viewer;

	ViewerGraphqlDtoEntity();

	factory ViewerGraphqlDtoEntity.fromJson(Map<String, dynamic> json) => $ViewerGraphqlDtoEntityFromJson(json);

	Map<String, dynamic> toJson() => $ViewerGraphqlDtoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ViewerGraphqlDtoViewer {
	late int id = 0;
	late String bannerImage = '';
	late ViewerGraphqlDtoViewerAvatar avatar;
	late ViewerGraphqlDtoViewerMediaListOptions mediaListOptions;
	late String name = '';

	ViewerGraphqlDtoViewer();

	factory ViewerGraphqlDtoViewer.fromJson(Map<String, dynamic> json) => $ViewerGraphqlDtoViewerFromJson(json);

	Map<String, dynamic> toJson() => $ViewerGraphqlDtoViewerToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ViewerGraphqlDtoViewerAvatar {
	late String medium = '';

	ViewerGraphqlDtoViewerAvatar();

	factory ViewerGraphqlDtoViewerAvatar.fromJson(Map<String, dynamic> json) => $ViewerGraphqlDtoViewerAvatarFromJson(json);

	Map<String, dynamic> toJson() => $ViewerGraphqlDtoViewerAvatarToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ViewerGraphqlDtoViewerMediaListOptions {
	late ViewerGraphqlDtoViewerMediaListOptionsAnimeList animeList;
	late ViewerGraphqlDtoViewerMediaListOptionsMangaList mangaList;
	late String scoreFormat = '';

	ViewerGraphqlDtoViewerMediaListOptions();

	factory ViewerGraphqlDtoViewerMediaListOptions.fromJson(Map<String, dynamic> json) => $ViewerGraphqlDtoViewerMediaListOptionsFromJson(json);

	Map<String, dynamic> toJson() => $ViewerGraphqlDtoViewerMediaListOptionsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ViewerGraphqlDtoViewerMediaListOptionsAnimeList {
	late List<String> customLists = [];

	ViewerGraphqlDtoViewerMediaListOptionsAnimeList();

	factory ViewerGraphqlDtoViewerMediaListOptionsAnimeList.fromJson(Map<String, dynamic> json) => $ViewerGraphqlDtoViewerMediaListOptionsAnimeListFromJson(json);

	Map<String, dynamic> toJson() => $ViewerGraphqlDtoViewerMediaListOptionsAnimeListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ViewerGraphqlDtoViewerMediaListOptionsMangaList {
	late List<dynamic> customLists = [];

	ViewerGraphqlDtoViewerMediaListOptionsMangaList();

	factory ViewerGraphqlDtoViewerMediaListOptionsMangaList.fromJson(Map<String, dynamic> json) => $ViewerGraphqlDtoViewerMediaListOptionsMangaListFromJson(json);

	Map<String, dynamic> toJson() => $ViewerGraphqlDtoViewerMediaListOptionsMangaListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}