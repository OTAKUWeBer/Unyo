import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unyo/core/di/locator.dart';

class MenuBarNotifier {
  final BehaviorSubject<bool> _menuBarSubject;
  final _logger = sl<Logger>();

  MenuBarNotifier() : _menuBarSubject = BehaviorSubject.seeded(false);

  // Public stream for Cubits to subscribe
  Stream<bool> get menuBarStream => _menuBarSubject.stream;

  void showMenuBar(bool showMenuBar) {
    _logger.d("MenuBar notifier updated with: $showMenuBar");
    _menuBarSubject.add(showMenuBar);
  }

  bool get isMenuBarVisible => _menuBarSubject.value;

  void dispose() => _menuBarSubject.close();
}