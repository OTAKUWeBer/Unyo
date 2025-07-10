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

// Feedback Effects
class ShowSnackbarEffect extends AppEffect {
  final String message;

  ShowSnackbarEffect(this.message);
}

class ShowDialogEffect extends AppEffect {
  final Dialog dialog;

  ShowDialogEffect(this.dialog);
}
