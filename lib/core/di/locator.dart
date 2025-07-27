// External dependencies
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unyo/application/cubits/anime_cubit.dart';
import 'package:unyo/application/cubits/manga_cubit.dart';
import 'package:unyo/application/cubits/media_list_cubit.dart';
import 'package:unyo/application/cubits/root_scaffold_cubit.dart';

// Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/application/cubits/login_cubit.dart';
import 'package:unyo/core/log/logger.dart';
import 'package:unyo/core/notifier/menu_bar_notifier.dart';
import 'package:unyo/core/notifier/tab_view_notifier.dart';
import 'package:unyo/core/notifier/user_notifier.dart';
import 'package:unyo/core/services/api/graphql/graphql_service.dart';
import 'package:unyo/core/services/api/http/http_service.dart';
import 'package:unyo/core/services/effects/app_effect_handler.dart';
import 'package:unyo/core/theme/color_image_service.dart';
import 'package:unyo/core/theme/theme_service.dart';
import 'package:unyo/data/repositories/anime_repository_anilist.dart';
import 'package:unyo/data/repositories/manga_repository_anilist.dart';
import 'package:unyo/data/repositories/repositories.dart';
import 'package:unyo/application/cubits/home_cubit.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Singletons
  sl.registerLazySingleton<Logger>(() => getLogger());

  // Services
  sl.registerLazySingleton<HttpService>(() => HttpService());
  sl.registerLazySingleton<GraphQLService>(
    () => GraphQLService(
      httpService: sl<HttpService>(),
      endpoint: config.anilistGraphQLEndpoint,
    ),
    instanceName: config.anilistGraphQlService,
  );
  sl.registerLazySingleton<AppEffectHandler>(() => AppEffectHandler());
  sl.registerSingleton<ThemeService>(ThemeService());
  sl.registerLazySingleton<ColorImageService>(() => ColorImageService());
  sl.registerLazySingletonAsync<Directory>(
    () => getApplicationSupportDirectory(),
    instanceName: config.applicationSupportDirectory,
  );

  // Notifiers
  sl.registerLazySingleton<UserNotifier>(
    () => UserNotifier(),
    instanceName: config.loggedUserNotifier,
  );
  sl.registerLazySingleton<UserNotifier>(
    () => UserNotifier(),
    instanceName: config.newUserNotifier,
  );
  sl.registerLazySingleton<MenuBarNotifier>(() => MenuBarNotifier());
  sl.registerLazySingleton<TabViewNotifier>(() => TabViewNotifier());

  // Repositories
  sl.registerLazySingleton<UserRepositoryLocal>(() => UserRepositoryLocal());
  sl.registerLazySingleton<UserRepositoryAnilist>(
    () => UserRepositoryAnilist(
      sl<UserNotifier>(instanceName: config.newUserNotifier),
    ),
  );
  sl.registerLazySingleton<AnimeRepositoryAnilist>(
    () => AnimeRepositoryAnilist(),
  );
  sl.registerLazySingleton<MangaRepositoryAnilist>(
    () => MangaRepositoryAnilist(),
  );

  // Cubits / Blocs
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      sl<UserRepositoryLocal>(),
      sl<UserNotifier>(instanceName: config.loggedUserNotifier),
      sl<UserNotifier>(instanceName: config.newUserNotifier),
      sl<TabViewNotifier>(),
      sl<UserRepositoryAnilist>(),
      sl<ColorImageService>(),
      sl<ThemeService>(),
    ),
  );
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      sl<UserNotifier>(instanceName: config.loggedUserNotifier),
      sl<UserRepositoryAnilist>(),
      sl<MenuBarNotifier>(),
    ),
  );
  sl.registerFactory<RootScaffoldCubit>(
    () => RootScaffoldCubit(
      sl<UserNotifier>(instanceName: config.loggedUserNotifier),
      sl<MenuBarNotifier>(),
        sl<TabViewNotifier>()
    ),
  );
  sl.registerFactory<AnimeCubit>(
    () => AnimeCubit(
      sl<AnimeRepositoryAnilist>(),
      sl<UserNotifier>(instanceName: config.loggedUserNotifier),
    ),
  );
  sl.registerFactory<MangaCubit>(
    () => MangaCubit(
      sl<MangaRepositoryAnilist>(),
      sl<UserNotifier>(instanceName: config.loggedUserNotifier),
    ),
  );
  sl.registerFactory<MediaListCubit>(() => MediaListCubit());
}
