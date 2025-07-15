// External dependencies
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/application/effects/app_effects.dart';
import 'package:unyo/core/di/locator.dart';

class AppEffectHandler {
  final _logger = sl<Logger>();

  AppEffectHandler();

  void handleEffects(
    BuildContext context,
    List<AppEffect> effects,
    void Function() clearAppEffects,
  ) {
    for (var effect in effects) {
      handle(effect, context);
    }
    clearAppEffects();
  }

  void handle(AppEffect effect, BuildContext context) {
    switch (effect) {
      case ShowSnackbarEffect showSnackBarEffect:
        _handleShowSnackbarEffect(showSnackBarEffect);
      case ReplaceRouteEffect replaceRouteEffect:
        _handleReplaceRouteEffect(replaceRouteEffect, context);
      case PushRouteEffect pushRouteEffect:
        _handlePushRouteEffect(pushRouteEffect, context);
      case ShowWidgetDialogEffect showWidgetDialogEffect:
        _handleShowWidgetDialogEffect(showWidgetDialogEffect, context);
      case CloseDialogEffect closeDialogEffect:
        _handleCloseDialogEffect(effect, closeDialogEffect.context);
      default:
        _handleUnkownEffect(effect);
    }
  }

  void _handleShowWidgetDialogEffect(
    ShowWidgetDialogEffect effect,
    BuildContext context,
  ) {
    _logger.d("Handling ShowWidgetDialogEffect");
    showDialog(
      context: context,
      builder:
          (dialogContext) => effect.dialog
    );
  }

  void _handleCloseDialogEffect(CloseDialogEffect effect, BuildContext context) {
    _logger.d("Handling CloseDialogEffect");
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      _logger.w("No Dialog found");
    }
  }

  void _handleShowSnackbarEffect(ShowSnackbarEffect effect) {
    _logger.d("Handling ShowSnackbarEffect");
  }

  void _handleReplaceRouteEffect(
    ReplaceRouteEffect effect,
    BuildContext context,
  ) {
    _logger.d("Handling ReplaceRouteEffect");
    context.router.root.replacePath(
      effect.routeName.replaceFirst("/", ""),
      onFailure: _handleRouteFailure,
    );
  }

  void _handlePushRouteEffect(PushRouteEffect effect, BuildContext context) {
    _logger.d("Handling PushRouteEffect");
    context.router.root.pushPath(
      effect.routeName.replaceFirst("/", ""),
      onFailure: _handleRouteFailure,
    );
  }

  void _handleRouteFailure(NavigationFailure failure) {
    _logger.e("Navigation failure: ${failure.toString()}");
  }

  void _handleUnkownEffect(AppEffect effect) {
    _logger.e("Unimplemented Effect Handler for effect: $effect");
  }
}
