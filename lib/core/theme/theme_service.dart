import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeService {
  final BehaviorSubject<ThemeData> _themeSubject;

  /*= BehaviorSubject<ThemeData>.seeded(_defaultTheme);*/
  ThemeService()
      : _themeSubject = BehaviorSubject<ThemeData>.seeded(_defaultTheme);


  Stream<ThemeData> get theme$ => _themeSubject.stream;

  ThemeData get current => _themeSubject.value;

  void updateThemeFromColors(
      {required Color primary, Color? secondary, Color? tertiary}) {
    final newTheme = _defaultTheme.copyWith(
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: secondary ?? ColorScheme.fromSeed(seedColor: primary).secondary,
        tertiary: tertiary ?? ColorScheme.fromSeed(seedColor: primary).tertiary,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
      ),
      appBarTheme: AppBarTheme(backgroundColor: primary),
    );
    _themeSubject.add(newTheme);
  }

  void updateThemeFromColorScheme(
      {required ColorScheme newcolorScheme}) {
    final newTheme = _defaultTheme.copyWith(
      colorScheme: newcolorScheme,
    );
    _themeSubject.add(newTheme);
  }

  void setTheme(ThemeData theme) => _themeSubject.add(theme);
}

final _defaultTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 44, 44, 44),
  // colorScheme: ColorScheme.dark(
  //   primary: Colors.grey[200]!,
  //   secondary: Colors.grey[300]!,
  //   tertiary: Colors.grey[300]!,
  //   onPrimary: Colors.white,
  //   onSecondary: Colors.white,
  //   onTertiary: Colors.white,
  // ),
  textTheme: const TextTheme(
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
    bodyLarge: TextStyle(color: Colors.white, fontSize: 14),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 12),
    bodySmall: TextStyle(color: Colors.white, fontSize: 10),

    // Label styles - black
    labelLarge: TextStyle(
      color: Colors.grey,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: Colors.grey,
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      color: Colors.grey,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
  ),
);
