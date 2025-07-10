//Flutter dependencies
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Internal dependencies
import 'package:unyo/core/di/locator.dart';
import 'package:unyo/core/router/app_router.dart';

final _appRouter = AppRouter();

void main() async {
  // Initialize Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Inject dependencies before running the app
  setupLocator();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
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
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: "Unyo",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 44, 44, 44),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // colorScheme: ColorScheme.dark(
        //   primary: Colors.grey[200]!,
        //   secondary: Colors.grey[300]!,
        //   surface: Colors.white,
        //   onSurface: Colors.grey[300]!,
        // ),
        textTheme: TextTheme(
          // Display styles (largest) - white
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),

          // Headline styles - white to light gray
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),

          // Title styles - light gray to mid gray
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
            // fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            // fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
            // fontWeight: FontWeight.w500,
          ),

          // Body styles - dark gray to black
          bodyLarge: TextStyle(color: Colors.grey[900], fontSize: 14),
          bodyMedium: TextStyle(color: Colors.grey[900], fontSize: 12),
          bodySmall: TextStyle(color: Colors.grey[900], fontSize: 10),

          // Label styles - black
          labelLarge: TextStyle(
            color: Colors.grey[900],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: TextStyle(
            color: Colors.grey[900],
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: TextStyle(
            color: Colors.grey[900],
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
