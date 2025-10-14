import 'package:unyo/generated/json/base/json_field.dart';
import 'package:unyo/generated/json/aniyomi_repo_json_entity.g.dart';
import 'dart:convert';
export 'package:unyo/generated/json/aniyomi_repo_json_entity.g.dart';

@JsonSerializable()
class AniyomiRepoJsonEntity {
	late String name = '';
	late String pkg = '';
	late String apk = '';
	late String lang = '';
	late double code;
	late String version = '';
	late double nsfw;
	late List<AniyomiRepoJsonSources> sources = [];

	AniyomiRepoJsonEntity();

	factory AniyomiRepoJsonEntity.fromJson(Map<String, dynamic> json) => $AniyomiRepoJsonEntityFromJson(json);

	Map<String, dynamic> toJson() => $AniyomiRepoJsonEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AniyomiRepoJsonSources {
	late String name = '';
	late String lang = '';
	late String id = '';
	late String baseUrl = '';

	AniyomiRepoJsonSources();

	factory AniyomiRepoJsonSources.fromJson(Map<String, dynamic> json) => $AniyomiRepoJsonSourcesFromJson(json);

	Map<String, dynamic> toJson() => $AniyomiRepoJsonSourcesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}