import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface),
    colorSchemeSeed: Colors.blue,
    brightness: Brightness.light,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.amber,
      shape: CircleBorder(),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.black,
      ),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.lightGreen,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 70,
        color: Colors.black,
        fontWeight: FontWeight(700),
      ),
      bodyLarge: TextStyle(fontSize: 50, color: Colors.grey),
      bodySmall: TextStyle(
        fontSize: 30,
        color: Colors.grey.shade400,
        fontStyle: FontStyle.italic,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff242424),
    // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface),
    colorSchemeSeed: Colors.pink,
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.purple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 70,
        color: Colors.white,
        fontWeight: FontWeight(700),
      ),
      bodyLarge: TextStyle(fontSize: 50, color: Colors.grey),
      bodySmall: TextStyle(
        fontSize: 30,
        color: Colors.grey.shade100,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
