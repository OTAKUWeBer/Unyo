import 'package:unyo/domain/entities/extension.dart';
import 'package:unyo/domain/entities/user.dart';

abstract class ExtensionRepository {
  Future<Set<Extension>> getAvailableAnimeExtensions(User loggedUser);
  Future<Set<Extension>> getAvailableMangaExtensions(User loggedUser);
  Future<Set<Extension>> getInstalledAnimeExtensions(User loggedUser);
  Future<Set<Extension>> getInstalledMangaExtensions(User loggedUser);
  Future<void> updateAnimeRepositoryUrl(String newUrl, User user);
  Future<void> updateMangaRepositoryUrl(String newUrl, User user);
  Future<void> addExtension(Extension extension);
  Future<void> removeExtension(Extension extension);
}