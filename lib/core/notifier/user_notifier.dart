// External dependencies
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
// Internal dependencies
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/data/models/user_model.dart';

class UserNotifier {
  final BehaviorSubject<UserModel> _userSubject;
  final _logger = sl<Logger>();

  UserNotifier() : _userSubject = BehaviorSubject.seeded(UserModel.empty());

  // Public stream for Cubits to subscribe
  Stream<UserModel> get userStream => _userSubject.stream;

  void updateUser(UserModel user) {
    _logger.d("User notifier updated with: ${user.name}");
    _userSubject.add(user);
  }

  UserModel get currentUser => _userSubject.value;

  void dispose() => _userSubject.close();
}
