// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:unyo/presentation/screens/anime_details_screen.dart' as _i1;
import 'package:unyo/presentation/screens/anime_screen.dart' as _i2;
import 'package:unyo/presentation/screens/calendar_screen.dart' as _i3;
import 'package:unyo/presentation/screens/home_screen.dart' as _i4;
import 'package:unyo/presentation/screens/login_screen.dart' as _i5;
import 'package:unyo/presentation/screens/manga_screen.dart' as _i6;
import 'package:unyo/presentation/screens/media_list_screen.dart' as _i7;
import 'package:unyo/presentation/screens/root_screen.dart' as _i8;
import 'package:unyo/presentation/screens/tabs_screen.dart' as _i9;

/// generated route for
/// [_i1.AnimeDetailsScreen]
class AnimeDetailsRoute extends _i10.PageRouteInfo<void> {
  const AnimeDetailsRoute({List<_i10.PageRouteInfo>? children})
    : super(AnimeDetailsRoute.name, initialChildren: children);

  static const String name = 'AnimeDetailsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnimeDetailsScreen();
    },
  );
}

/// generated route for
/// [_i2.AnimeScreen]
class AnimeRoute extends _i10.PageRouteInfo<void> {
  const AnimeRoute({List<_i10.PageRouteInfo>? children})
    : super(AnimeRoute.name, initialChildren: children);

  static const String name = 'AnimeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.AnimeScreen();
    },
  );
}

/// generated route for
/// [_i3.CalendarScreen]
class CalendarRoute extends _i10.PageRouteInfo<void> {
  const CalendarRoute({List<_i10.PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.CalendarScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginScreen();
    },
  );
}

/// generated route for
/// [_i6.MangaScreen]
class MangaRoute extends _i10.PageRouteInfo<void> {
  const MangaRoute({List<_i10.PageRouteInfo>? children})
    : super(MangaRoute.name, initialChildren: children);

  static const String name = 'MangaRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.MangaScreen();
    },
  );
}

/// generated route for
/// [_i7.MediaListScreen]
class MediaListRoute extends _i10.PageRouteInfo<MediaListRouteArgs> {
  MediaListRoute({
    required String? type,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         MediaListRoute.name,
         args: MediaListRouteArgs(type: type, key: key),
         rawQueryParams: {'type': type},
         initialChildren: children,
       );

  static const String name = 'MediaListRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<MediaListRouteArgs>(
        orElse: () => MediaListRouteArgs(type: queryParams.optString('type')),
      );
      return _i7.MediaListScreen(args.type, key: args.key);
    },
  );
}

class MediaListRouteArgs {
  const MediaListRouteArgs({required this.type, this.key});

  final String? type;

  final _i11.Key? key;

  @override
  String toString() {
    return 'MediaListRouteArgs{type: $type, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MediaListRouteArgs) return false;
    return type == other.type && key == other.key;
  }

  @override
  int get hashCode => type.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i8.RootScreen]
class RootRoute extends _i10.PageRouteInfo<void> {
  const RootRoute({List<_i10.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.RootScreen();
    },
  );
}

/// generated route for
/// [_i9.TabsScreen]
class TabsRoute extends _i10.PageRouteInfo<void> {
  const TabsRoute({List<_i10.PageRouteInfo>? children})
    : super(TabsRoute.name, initialChildren: children);

  static const String name = 'TabsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.TabsScreen();
    },
  );
}
