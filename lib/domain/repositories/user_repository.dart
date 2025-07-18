import 'package:unyo/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchAllLoggedInUsers();
  Future<void> attemptCreateUser();
}
