import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/core/enums/selected_menu_option.dart';
import 'package:unyo/domain/entities/user.dart';

part 'root_scaffold_state.freezed.dart';

@freezed
abstract class RootScaffoldState with _$RootScaffoldState {
  const factory RootScaffoldState({
    required SelectedMenuOption selectedMenuOption,
    required bool showMenuBar,
    required User loggedUser,
    @Default(<AppEffect>[]) List<AppEffect> effects,
  }) = _RootScaffoldState;

  const RootScaffoldState._();

}