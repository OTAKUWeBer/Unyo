// External dependencies
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
// Internal dependencies
import 'package:unyo/application/effects/app_effects.dart';

mixin EffectMixin<State> on Cubit<State> {
  State copyStateWithEffects(State state, List<AppEffect> effects);
  Logger get logger;
  static const Map<String, int> _routesIndexMapper = {
    "/home" : 0,
    "/anime" : 1,
    "/manga" : 2,
  };

  void addEffect(AppEffect effect) {
    logger.d("Adding AppEffect: $effect");
    final current = state;
    final newEffects = [..._currentEffects, effect];
    emit(copyStateWithEffects(current, newEffects));
  }

  void clearEffects() {
    logger.d("Clearing all effects");
    emit(copyStateWithEffects(state, []));
  }

  List<AppEffect> get _currentEffects {
    if (state is HasEffects) {
      return (state as HasEffects).stateEffects;
    }
    throw StateError('Cubit/Bloc State must implement HasEffects');
  }

  void showWidgetDialogEffect({required Widget dialog}) {
    logger.i("ShowWidgetDialog with dialog: $dialog");
    addEffect(ShowWidgetDialogEffect(dialog));
  }

  void closeDialogEffect(BuildContext context) {
    logger.i("CloseDialog attempted");
    addEffect(CloseDialogEffect(context));
  }

  void showSnackBarEffect(String title, {required String message, required ContentType contentType}) {
    logger.i("ShowSnackbar with message: $message");
    addEffect(ShowSnackbarEffect(title, message: message, contentType: contentType));
  }

  void replaceRouteEffect({required String path}) {
    logger.i("ReplaceRoute with path: $path");
    addEffect(ReplaceRouteEffect(path));
  }

  void navigateRouteEffect({required String path}) {
    logger.i("NavigateRoute with path: $path");
    addEffect(NavigateRouteEffect(path));
  }

  void pushRouteEffect({required String path}) {
    logger.i("PushRoute with path: $path");
    addEffect(PushRouteEffect(path));
  }

  void changeRouteTabEffect( BuildContext context, {required String path}) {
    if (!_routesIndexMapper.containsKey(path)) {
      logger.e("Route with path $path is not in AutoTabsRouter, therefore not allowed");
    }
    logger.i("ChangeRouteTab with path: $path");
    addEffect(ChangeTabRouteEffect(_routesIndexMapper[path]!, context));
  }

  // Handle errors and others
  void handleError(String message, {ContentType contentType = ContentType.failure, StackTrace? stackTrace}) {
    logger.e(message, stackTrace: stackTrace);
    showSnackBarEffect(
      "Something went wrong",
      message: message,
      contentType: contentType,
    );
  }
}

abstract class HasEffects {
  List<AppEffect> get stateEffects;
}
