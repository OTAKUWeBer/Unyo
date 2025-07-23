import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unyo/application/states/root_scaffold_state.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/core/notifier/menu_bar_notifier.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/domain/entities/user.dart';

class RootScaffoldCubit extends Cubit<RootScaffoldState> {
  final UserNotifier _loggedUserNotifier;
  final MenuBarNotifier _menuBarNotifier;
  late StreamSubscription<User> _newLoggedUserSubscription;
  late StreamSubscription<bool> _showMenuBarSubscription;

  RootScaffoldCubit(this._loggedUserNotifier, this._menuBarNotifier) : super(RootScaffoldState(selectedMenuOption: SelectedMenuOption.home, showMenuBar: false, loggedUser: UserModel.empty())) {
   _init();
  }

  void _init() {
    _newLoggedUserSubscription = _loggedUserNotifier.userStream.listen((user){
      if (user == UserModel.empty()) {
        return;
      }
      emit(state.copyWith(loggedUser: user)); // Update state on new data
    });
    _showMenuBarSubscription = _menuBarNotifier.menuBarStream.listen((showMenuBar){
      emit(state.copyWith(showMenuBar: showMenuBar)); // Update state on new data
    });
  }

  @override
  Future<void> close() {
    _newLoggedUserSubscription.cancel();
    return super.close();
  }

  void selectMenuOption(SelectedMenuOption option) {
    emit(state.copyWith(selectedMenuOption: option));
  }
}
