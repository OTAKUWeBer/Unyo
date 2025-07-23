import 'package:auto_route/auto_route.dart';
import 'package:unyo/core/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  // @override
  // RouteType get defaultRouteType => RouteType.custom();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RootScaffoldRoute.page,
      path: '/',
      children: [
        CustomRoute(
          page: LoginRoute.page,
          path: 'login',
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
          duration: Duration.zero,
          reverseDuration: Duration.zero
        ),
        CustomRoute(
          page: HomeRoute.page,
          path: 'home',
          transitionsBuilder: TransitionsBuilders.noTransition,
          duration: Duration.zero,
          reverseDuration: Duration.zero
        ),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // guards can be added here
  ];
}
