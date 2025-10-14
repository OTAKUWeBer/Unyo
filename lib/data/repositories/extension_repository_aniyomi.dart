import 'package:logger/logger.dart';
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/services/api/dto/extensions/aniyomi_repo_json_entity.dart';
import 'package:unyo/core/services/api/dto/extensions/tachiyomi_repo_json_entity.dart';
import 'package:unyo/core/services/api/http/api_response.dart';
import 'package:unyo/core/services/api/http/http_service.dart';
import 'package:unyo/domain/entities/extension.dart';
import 'package:unyo/domain/entities/user.dart';
import 'package:unyo/domain/repositories/extension_repository.dart';

class ExtensionRepositoryAniyomi implements ExtensionRepository {
  final Logger _logger = sl<Logger>();
  final HttpService _httpService = sl<HttpService>();

  @override
  Future<Set<Extension>> getAvailableAnimeExtensions(User user) async {
    _logger.d("Fetching available anime extensions for AniyomiBridge.");
    final String aniyomiExtensionsRepositoryUrl = user.settings.aniyomiExtensionsRepositoryUrl;
    ApiResponse<List<AniyomiRepoJsonEntity>> repositoryResponse = await _httpService.get(
      aniyomiExtensionsRepositoryUrl,
      fromJson: _parseAniyomiRepoJsonList,
    );
    return repositoryResponse.data
        .map(
          (aniyomiRepoJsonEntity) => ExtensionModel(
            name: aniyomiRepoJsonEntity.name.replaceFirst("Aniyomi: ", ""),
            pkg: aniyomiRepoJsonEntity.pkg,
            apk:
                "${aniyomiExtensionsRepositoryUrl.replaceFirst("index.min.json", "apk/")}${aniyomiRepoJsonEntity.apk}.png",
            icon:
                "${aniyomiExtensionsRepositoryUrl.replaceFirst("index.min.json", "icon/")}${aniyomiRepoJsonEntity.pkg}.png",
            lang: aniyomiRepoJsonEntity.lang,
            version: aniyomiRepoJsonEntity.version,
            nsfw: aniyomiRepoJsonEntity.nsfw.toInt(),
            type: 'Aniyomi',
          ),
        )
        .toSet();
  }

  @override
  Future<Set<Extension>> getAvailableMangaExtensions(User user) async{
    _logger.i("Fetching available manga extensions for AniyomiBridge.");
    final String tachiyomiExtensionsRepositoryUrl = user.settings.tachiyomiExtensionsRepositoryUrl;
    ApiResponse<List<TachiyomiRepoJsonEntity>> repositoryResponse = await _httpService.get(
      tachiyomiExtensionsRepositoryUrl,
      fromJson:  _parseTachiyomiRepoJsonList,
    );
    return repositoryResponse.data
        .map(
          (tachiyomiRepoJsonEntity) => ExtensionModel(
            name: tachiyomiRepoJsonEntity.name.replaceFirst("Tachiyomi: ", ""),
            pkg: tachiyomiRepoJsonEntity.pkg,
            apk:
                "${tachiyomiExtensionsRepositoryUrl.replaceFirst("index.min.json", "apk/")}${tachiyomiRepoJsonEntity.apk}.png",
            icon:
                "${tachiyomiExtensionsRepositoryUrl.replaceFirst("index.min.json", "icon/")}${tachiyomiRepoJsonEntity.pkg}.png",
            lang: tachiyomiRepoJsonEntity.lang,
            version: tachiyomiRepoJsonEntity.version,
            nsfw: tachiyomiRepoJsonEntity.nsfw.toInt(),
            type: 'Tachiyomi',
          ),
        )
        .toSet();
  }

  @override
  Future<Set<Extension>> getInstalledAnimeExtensions(User user) {
    throw UnimplementedError();
  }

  @override
  Future<Set<Extension>> getInstalledMangaExtensions(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateRepositoryUrl(String newUrl) {
    throw UnimplementedError();
  }

  List<AniyomiRepoJsonEntity> _parseAniyomiRepoJsonList(Map<String, dynamic> json) {
    return ((json['list'] as List<dynamic>?) ?? [])
        .map((jsonItem) => AniyomiRepoJsonEntity.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }

  List<TachiyomiRepoJsonEntity> _parseTachiyomiRepoJsonList(Map<String, dynamic> json) {
    return ((json['list'] as List<dynamic>?) ?? [])
        .map((jsonItem) => TachiyomiRepoJsonEntity.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
