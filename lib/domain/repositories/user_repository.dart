import 'package:unyo/domain/entities/anime.dart';
import 'package:unyo/domain/entities/manga.dart';
import 'package:unyo/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchAllLoggedInUsers();
  Future<void> attemptCreateUser();
  Future<List<Anime>> getUserWatchingList(User user);
  Future<List<Manga>> getUserReadingList(User user);
}
