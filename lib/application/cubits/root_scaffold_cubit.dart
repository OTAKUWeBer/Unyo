import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:unyo/application/cubits/effect_mixin.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/application/states/root_scaffold_state.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/core/notifier/menu_bar_notifier.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/domain/entities/user.dart';

class RootScaffoldCubit extends Cubit<RootScaffoldState> with EffectMixin<RootScaffoldState>{
  final UserNotifier _loggedUserNotifier;
  final MenuBarNotifier _menuBarNotifier;
  final Logger _logger = Logger();
  late StreamSubscription<User> _newLoggedUserSubscription;
  late StreamSubscription<bool> _showMenuBarSubscription;

  RootScaffoldCubit(this._loggedUserNotifier, this._menuBarNotifier) : super(RootScaffoldState(selectedMenuOption: SelectedMenuOption.home, showMenuBar: false, loggedUser: UserModel.empty())) {
   _init();
  }

  @override
  RootScaffoldState copyStateWithEffects(RootScaffoldState state, List<AppEffect> effects) {
    return state.copyWith(effects: effects);
  }

  @override
  Logger get logger => _logger;

  void _init() {
    _newLoggedUserSubscription = _loggedUserNotifier.userStream.listen((user){
      if (user == UserModel.empty()) {
        return;
      }
      emit(state.copyWith(loggedUser: user));
    });
    _showMenuBarSubscription = _menuBarNotifier.menuBarStream.listen((showMenuBar){
      emit(state.copyWith(showMenuBar: showMenuBar));
    });
  }

  @override
  Future<void> close() {
    _newLoggedUserSubscription.cancel();
    _showMenuBarSubscription.cancel();
    return super.close();
  }

  void selectMenuOption(SelectedMenuOption option) {
    _logger.i("Selected menu option: $option");
    switch (option) {
      case SelectedMenuOption.home:
        navigateRouteEffect(path: "/home");
      case SelectedMenuOption.anime:
        navigateRouteEffect(path: "/anime");
      case SelectedMenuOption.manga:
        navigateRouteEffect(path: "/manga");
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
