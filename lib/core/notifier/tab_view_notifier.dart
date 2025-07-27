// External dependencies
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
// Internal dependencies
import 'package:unyo/core/di/locator.dart';

class TabViewNotifier {
  final BehaviorSubject<bool> _tabViewSubject;
  final _logger = sl<Logger>();

  TabViewNotifier() : _tabViewSubject = BehaviorSubject.seeded(false);

  // Public stream for Cubits to subscribe
  Stream<bool> get tabViewStream => _tabViewSubject.stream;

  void showTabView(bool showTabView) {
    _logger.d("TabView notifier updated with: $showTabView");
    _tabViewSubject.add(showTabView);
  }

  bool get isTabViewVisible => _tabViewSubject.value;

  void dispose() => _tabViewSubject.close();
}