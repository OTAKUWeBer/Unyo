// External dependencies
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/application/cubits/login_cubit.dart';
import 'package:unyo/core/log/logger.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/core/services/api/graphql/graphql_service.dart';
import 'package:unyo/core/services/api/http/http_service.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/data/repositories/repositories.dart';
import 'package:unyo/application/cubits/home_cubit.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Singletons
  sl.registerLazySingleton<Logger>(() => getLogger());

  // Services
  sl.registerLazySingleton<HttpService>(() => HttpService());
  sl.registerLazySingleton<GraphQLService>(() => GraphQLService(httpService: sl<HttpService>(), endpoint: config.anilistGraphQLEndpoint), instanceName: config.anilistGraphQlService);
  sl.registerLazySingleton<AppEffectHandler>(() => AppEffectHandler());
  sl.registerLazySingletonAsync<Directory>(() => getApplicationSupportDirectory(), instanceName: config.applicationSupportDirectory);

  // Notifiers
  sl.registerLazySingleton<UserNotifier>(() => UserNotifier(), instanceName: config.loggedUserNotifier);
  sl.registerLazySingleton<UserNotifier>(() => UserNotifier(), instanceName: config.newUserNotifier);

  // Repositories
  sl.registerLazySingleton<UserRepositoryLocal>(() => UserRepositoryLocal());
  sl.registerLazySingleton<UserRepositoryAnilist>(() => UserRepositoryAnilist(sl<UserNotifier>(instanceName: config.newUserNotifier)));

  // Cubits / Blocs
  sl.registerFactory<LoginCubit>(() => LoginCubit(
      sl(),
      sl<UserNotifier>(instanceName: config.loggedUserNotifier),
      sl<UserNotifier>(instanceName: config.newUserNotifier),
      sl()
    )
  );
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl(), sl<UserNotifier>(instanceName: config.loggedUserNotifier)));
}
