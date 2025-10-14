import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/tachiyomi_repo_json_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/tachiyomi_repo_json_entity.g.dart';

@JsonSerializable()
class TachiyomiRepoJsonEntity {
	late String name = '';
	late String pkg = '';
	late String apk = '';
	late String lang = '';
	late double code;
	late String version = '';
	late double nsfw;
	late List<TachiyomiRepoJsonSources> sources = [];

	TachiyomiRepoJsonEntity();

	factory TachiyomiRepoJsonEntity.fromJson(Map<String, dynamic> json) => $TachiyomiRepoJsonEntityFromJson(json);

	Map<String, dynamic> toJson() => $TachiyomiRepoJsonEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TachiyomiRepoJsonSources {
	late String name = '';
	late String lang = '';
	late String id = '';
	late String baseUrl = '';

	TachiyomiRepoJsonSources();

	factory TachiyomiRepoJsonSources.fromJson(Map<String, dynamic> json) => $TachiyomiRepoJsonSourcesFromJson(json);

	Map<String, dynamic> toJson() => $TachiyomiRepoJsonSourcesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}