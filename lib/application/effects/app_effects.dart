import 'package:flutter/material.dart';

abstract class AppEffect {}

// Navigation Effects
class ReplaceRouteEffect extends AppEffect {
  final String routeName;
  final Object? arguments;

  ReplaceRouteEffect(this.routeName, {this.arguments});
}

class PushRouteEffect extends AppEffect {
  final String routeName;
  final Object? arguments;

  PushRouteEffect(this.routeName, {this.arguments});
}

// Dialogs Effects
class ShowWidgetDialogEffect extends AppEffect {
  final Widget dialog;

  ShowWidgetDialogEffect(this.dialog);
}

class CloseDialogEffect extends AppEffect {
  BuildContext context;

  CloseDialogEffect(this.context);
}

// Feedback Effects
class ShowSnackbarEffect extends AppEffect {
  final String message;

  ShowSnackbarEffect(this.message);
}