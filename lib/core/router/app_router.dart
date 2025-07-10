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
        AutoRoute(page: LoginRoute.page, path: 'login', initial: true),
        AutoRoute(page: HomeRoute.page, path: 'home')
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // guards can be added here
  ];
}
