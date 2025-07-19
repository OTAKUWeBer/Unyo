
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeService {
  final _themeSubject = BehaviorSubject<ThemeData>.seeded(_defaultTheme);

  Stream<ThemeData> get theme$ => _themeSubject.stream;
  ThemeData get current => _themeSubject.value;

  void updateTheme(Color primary, [Color? secondary]) {
    final newTheme = _defaultTheme.copyWith(
      colorScheme: ColorScheme.dark(
        primary: primary,
        secondary: secondary ?? Colors.grey[300]!,
        tertiary: secondary ?? Colors.grey[300]!,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
      ),
      appBarTheme: AppBarTheme(backgroundColor: primary),
    );

    _themeSubject.add(newTheme);
  }

  void setTheme(ThemeData theme) => _themeSubject.add(theme);
}

final _defaultTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 44, 44, 44),
  colorScheme: ColorScheme.dark(
    primary: Colors.grey[200]!,
    secondary: Colors.grey[300]!,
    tertiary: Colors.grey[300]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onTertiary: Colors.white,
  ),
);
