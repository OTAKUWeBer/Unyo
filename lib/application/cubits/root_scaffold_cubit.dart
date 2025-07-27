import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/root_scaffold_state.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/core/notifier/menu_bar_notifier.dart';
import 'package:unyo/core/notifier/tab_view_notifier.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/domain/entities/user.dart';

class RootScaffoldCubit extends Cubit<RootScaffoldState>
    with EffectMixin<RootScaffoldState> {
  final UserNotifier _loggedUserNotifier;
  final MenuBarNotifier _menuBarNotifier;
  final TabViewNotifier _tabViewNotifier;
  final Logger _logger = Logger();
  late StreamSubscription<User> _newLoggedUserSubscription;
  late StreamSubscription<bool> _showMenuBarSubscription;
  late StreamSubscription<bool> _showTabViewSubscription;

  RootScaffoldCubit(
    this._loggedUserNotifier,
    this._menuBarNotifier,
    this._tabViewNotifier,
  ) : super(
        RootScaffoldState(
          selectedMenuOption: SelectedMenuOption.home,
          showMenuBar: false,
          showTabView: false,
          loggedUser: UserModel.empty(),
        ),
      ) {
    _init();
  }

  @override
  RootScaffoldState copyStateWithEffects(
    RootScaffoldState state,
    List<AppEffect> effects,
  ) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  void _init() {
    _newLoggedUserSubscription = _loggedUserNotifier.userStream.listen((user) {
      if (user == UserModel.empty()) {
        return;
      }
      emit(state.copyWith(loggedUser: user));
    });
    _showMenuBarSubscription = _menuBarNotifier.menuBarStream.listen((
      showMenuBar,
    ) {
      emit(state.copyWith(showMenuBar: showMenuBar));
    });
    _showMenuBarSubscription = _tabViewNotifier.tabViewStream.listen((
      showTabView,
    ) {
      emit(state.copyWith(showTabView: showTabView));
    });
  }

  @override
  Future<void> close() {
    _newLoggedUserSubscription.cancel();
    _showMenuBarSubscription.cancel();
    _showTabViewSubscription.cancel();
    return super.close();
  }

  void selectMenuOption(SelectedMenuOption option, BuildContext context) {
    _logger.i("Selected menu option: $option");
    switch (option) {
      case SelectedMenuOption.home:
        changeRouteTabEffect(path: "/home", context);
      case SelectedMenuOption.anime:
        changeRouteTabEffect(path: "/anime", context);
      case SelectedMenuOption.manga:
        changeRouteTabEffect(path: "/manga", context);
      case SelectedMenuOption.calendar:
      case SelectedMenuOption.search:
      case SelectedMenuOption.library:
      case SelectedMenuOption.extensions:
      case SelectedMenuOption.settings:
      case SelectedMenuOption.exit:
    }
    emit(state.copyWith(selectedMenuOption: option));
  }
}
