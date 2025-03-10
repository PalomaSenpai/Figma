import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF42A5F5),
        onPrimary: Colors.white,
        secondary: Color(0xFFFF7043),
        onSecondary: Colors.white,
        error: Color(0xFFEF5350),
        onError: Colors.white,
        surface: Color(0xFFF5F5F5),
        onSurface: Color(0xFF424242),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF212121)),
        bodyMedium: TextStyle(color: Color(0xFF424242)),
        headlineLarge: TextStyle(color: Color(0xFF1976D2)),
        headlineMedium: TextStyle(color: Color(0xFF1976D2)),
      ),
    );
    return theme;
  }

  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF1976D2),
        onPrimary: Colors.white,
        secondary: Color(0xFF26A69A),
        onSecondary: Colors.white,
        error: Color(0xFFD32F2F),
        onError: Colors.white,
        surface: Color(0xFF212121),
        onSurface: Color(0xFFE0E0E0),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
        bodyMedium: TextStyle(color: Color(0xFFB0BEC5)),
        headlineLarge: TextStyle(color: Color(0xFF42A5F5)),
        headlineMedium: TextStyle(color: Color(0xFF42A5F5)),
      ),
    );
    return theme;
  }

  static ThemeData themePerso({
    required Color primary,
    required Color secondary,
    required Color surface,
    required Color onSurface,
  }) {
    final theme = ThemeData.light().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: Colors.white,
        secondary: secondary,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: surface,
        onSurface: onSurface,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: onSurface),
        bodyMedium: TextStyle(color: onSurface),
        headlineLarge: TextStyle(color: primary),
        headlineMedium: TextStyle(color: primary),
      ),
    );
    return theme;
  }
}