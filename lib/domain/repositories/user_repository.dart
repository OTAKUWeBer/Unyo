import 'package:unyo/domain/entities/user.dart';

import '../../core/services/api/dto/api_dtos.dart';

abstract class UserRepository {
  Future<List<User>> fetchAllLoggedInUsers();
  Future<void> attemptCreateUser();
}
