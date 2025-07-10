import 'package:unyo/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> fetchAllUsers();
  Future<void> registerUser(User user);
}
