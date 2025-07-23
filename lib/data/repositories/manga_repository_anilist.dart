import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/repositories/manga_repository.dart';

class MangaRepositoryAnilist implements MangaRepository{
  @override
  Future<List<Manga>> getLatestMangas(int page) {
    // TODO: implement getLatestMangas
    throw UnimplementedError();
  }

  @override
  Future<List<Manga>> getPopularMangas(int page) {
    // TODO: implement getPopularMangas
    throw UnimplementedError();
  }

  @override
  Future<List<Manga>> getTrendingMangas(int page) {
    // TODO: implement getTrendingMangas
    throw UnimplementedError();
  }

  @override
  Future<List<Manga>> getMangaCarouselBanners() {
    // TODO: implement getMangaCarouselBanners
    throw UnimplementedError();
  }
}
