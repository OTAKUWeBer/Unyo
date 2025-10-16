import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchAllLoggedInUsers();
  Future<void> attemptCreateUser();
  Future<void> updateUserInfo(User user);
  Future<List<Anime>> getUserWatchingList(User user);
  Future<List<Manga>> getUserReadingList(User user);
  Future<Map<String, List<Anime>>> getUserAnimeLists(User user);
  Future<Map<String, List<Manga>>> getUserMangaLists(User user);
}
