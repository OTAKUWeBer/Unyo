// External Dependencies
import 'package:logger/logger.dart';

// Internal Dependencies
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/data/models/models.dart';
import 'package:unyo/domain/entities/entities.dart';
import 'package:unyo/domain/repositories/user_repository.dart';

class UserRepositoryHive implements UserRepository {
  final Logger _logger = sl<Logger>();

  @override
  Future<List<User>> fetchAllUsers() async {
    return [UserModel.empty()];
  }

  @override
  Future<void> registerUser(User user) {
    throw UnimplementedError();
  }


}
