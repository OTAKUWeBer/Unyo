import 'package:auto_route/auto_route.dart';
import 'package:unyo/core/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  // @override
  // RouteType get defaultRouteType => RouteType.custom();

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: RootRoute.page,
      path: '/',
      transitionsBuilder: TransitionsBuilders.noTransition,
      duration: Duration.zero,
      reverseDuration: Duration.zero,
      children: [
        CustomRoute(
          page: LoginRoute.page,
          path: 'login',
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
          duration: Duration.zero,
          reverseDuration: Duration.zero,
        ),
        CustomRoute(
          page: TabsRoute.page,
          path: 'tabs',
          transitionsBuilder: TransitionsBuilders.noTransition,
          duration: Duration.zero,
          reverseDuration: Duration.zero,
          children: [
            CustomRoute(
              page: HomeRoute.page,
              path: 'home',
              transitionsBuilder: TransitionsBuilders.noTransition,
              duration: Duration.zero,
              reverseDuration: Duration.zero,
            ),
            CustomRoute(
              page: AnimeRoute.page,
              path: 'anime',
              transitionsBuilder: TransitionsBuilders.noTransition,
              duration: Duration.zero,
              reverseDuration: Duration.zero,
            ),
            CustomRoute(
              page: MangaRoute.page,
              path: 'manga',
              transitionsBuilder: TransitionsBuilders.noTransition,
              duration: Duration.zero,
              reverseDuration: Duration.zero,
            ),
          ],
        ),
        CustomRoute(
          page: MediaListRoute.page,
          path: 'userlist',
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          duration: const Duration(milliseconds: 200),
          reverseDuration: const Duration(milliseconds: 200),
        ),
        CustomRoute(
          page: CalendarRoute.page,
          path: 'calendar',
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          duration: const Duration(milliseconds: 200),
          reverseDuration: const Duration(milliseconds: 200),
        ),
        CustomRoute(
          page: AnimeDetailsRoute.page,
          path: 'animedetails',
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          duration: const Duration(milliseconds: 150),
          reverseDuration: const Duration(milliseconds: 150),
        ),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // guards can be added here
  ];
}
