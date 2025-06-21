import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';

class NotificationManager {
  // Singleton instance
  static final NotificationManager _instance = NotificationManager._internal();

  // Private constructor
  NotificationManager._internal();

  // Factory constructor to return the singleton instance
  factory NotificationManager() {
    return _instance;
  }

  /// Shows a success notification with the given message.
  void showSuccessNotification(
      BuildContext context, String message, DesktopSnackBarPosition position) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.success,
      desktopSnackBarPosition: position,
    ).show(context);
  }

  /// Shows an information notification with the given message.
  void showInfoNotification(
      BuildContext context, String message, DesktopSnackBarPosition position) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.info,
      desktopSnackBarPosition: position,
    ).show(context);
  }

  /// Shows a warning notification with the given message.
  void showWarningNotification(
      BuildContext context, String message, DesktopSnackBarPosition position) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.warning,
      desktopSnackBarPosition: position,
    ).show(context);
  }

  /// Shows an error notification with the given message.
  void showErrorNotification(
      BuildContext context, String message, DesktopSnackBarPosition position) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.error,
      desktopSnackBarPosition: position,
    ).show(context);
  }
}
