import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:logger/logger.dart';

//Internal dependencies
import 'package:unyo/config/config.dart' as config;
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/router/app_router.dart';
import 'package:unyo/core/theme/theme_service.dart';
import 'package:unyo/hive_registrar.g.dart';

final _appRouter = AppRouter();

void main() async {
  // Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Inject dependencies before running the app
  setupLocator();
  // Initialize Hive and register adapters
  await sl.isReady<Directory>(instanceName: config.applicationSupportDirectory);
  Hive
    ..init(sl<Directory>(instanceName: config.applicationSupportDirectory).path)
    ..registerAdapters();
  // Inject the remaining dependencies that rely on Hive and are not Lazy
  setupLocatorAfterHiveInit();
  //Run Flutter app with localization and screen utilities
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: ScreenUtilInit(
        designSize: const Size(1280, 720),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      stream: sl<ThemeService>().theme$,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        // Handle loading and error states
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
            debugShowCheckedModeBanner: false,
          );
        }

        if (snapshot.hasError) {
          sl<Logger>().e("Theme stream error: ${snapshot.error}");
          return MaterialApp(
            theme: ThemeData.dark(),
            home: const Scaffold(body: Center(child: Text("Error loading theme"))),
            debugShowCheckedModeBanner: false,
          );
        }
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: "Unyo",
          theme: snapshot.requireData,
          // Use fallback theme
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
