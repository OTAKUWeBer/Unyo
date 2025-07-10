// External dependencies
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

// Internal dependencies
import 'package:unyo/application/cubits/login_cubit.dart';
import 'package:unyo/core/log/logger.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
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
  sl.registerLazySingleton<AppEffectHandler>(() => AppEffectHandler());

  // Notifiers
  sl.registerLazySingleton<UserNotifier>(() => UserNotifier());

  // Repositories
  sl.registerLazySingleton<UserRepositoryHive>(() => UserRepositoryHive());

  // Cubits / Blocs
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl(), sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl(), sl()));
}
