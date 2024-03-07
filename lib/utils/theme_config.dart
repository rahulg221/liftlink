import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ColorPalette {
  // Background colors
  static Color darkBackgroundColor = const Color.fromARGB(255, 18, 18, 18);
  static Color lightBackgroundColor = const Color.fromARGB(255, 245, 245, 245);
  // App bar colors
  static Color darkAppBarColor = const Color.fromARGB(255, 18, 18, 18);
  static Color lightAppBarColor = const Color.fromARGB(255, 245, 245, 245);
  // Nav bar colors
  static Color darkNavBarColor = darkPrimaryColor.withOpacity(0.2);
  static Color lightNavBarColor = lightPrimaryColor.withOpacity(0.2);
  // Surface colors
  static Color darkSurfaceColor = Colors.white.withOpacity(0.07);
  static Color lightSurfaceColor = Colors.black.withOpacity(0.07);
  // Primary colors
  static Color darkPrimaryColor = const Color.fromARGB(255, 173, 127, 254);
  static Color lightPrimaryColor = const Color.fromARGB(255, 173, 127, 254);
  // Secondary colors
  static Color darkSecondaryColor = Color.fromARGB(255, 148, 104, 224);
  static Color lightSecondaryColor = Color.fromARGB(255, 148, 104, 224);
  // On background headers
  static Color darkBackgroundHeaderColor = Colors.white;
  static Color lightBackgroundHeaderColor = Colors.black;
  // On background
  static Color darkOnBackgroundColor = Colors.white;
  static Color lightOnBackgroundColor = Colors.black;
  // On surface
  static Color darkOnSurfaceColor = Colors.white.withOpacity(0.9);
  static Color lightOnSurfaceColor = Colors.black.withOpacity(0.9);
  // On primary
  static Color darkOnPrimaryColor = Colors.black;
  static Color lightOnPrimaryColor = Colors.black;
  // On secondary
  static Color darkOnSecondaryColor = Colors.white.withOpacity(0.9);
  static Color lightOnSecondaryColor = Colors.white.withOpacity(0.9);
  // Default icon color
  static Color darkIconColor = Color.fromARGB(255, 245, 245, 245);
  static Color lightIconColor = Color.fromARGB(255, 18, 18, 18);
  // Snack bar colors
  static Color darkSnackBar = Color.fromARGB(255, 40, 40, 40);
  static Color lightSnackBar = Color.fromARGB(255, 174, 174, 174);
}

class ThemeConfig {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorPalette.lightBackgroundColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorPalette.lightPrimaryColor,
      onPrimary: ColorPalette.lightOnPrimaryColor,
      secondary: ColorPalette.lightSecondaryColor,
      onSecondary: ColorPalette.lightOnSecondaryColor,
      background: ColorPalette.lightBackgroundColor,
      onBackground: ColorPalette.lightOnBackgroundColor,
      surface: ColorPalette.lightSurfaceColor,
      onSurface: ColorPalette.lightOnSurfaceColor,
      error: Colors.red,
      onError: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorPalette.lightSecondaryColor,
      foregroundColor: ColorPalette.lightOnSecondaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: ColorPalette.lightAppBarColor,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ColorPalette.lightSnackBar,
    ),
    iconTheme: IconThemeData(
      color: ColorPalette.lightIconColor,
      size: iconSize,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 33,
        color: ColorPalette.lightBackgroundHeaderColor,
        fontFamily: customFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        color: ColorPalette.lightBackgroundHeaderColor,
        fontFamily: customFont,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        color: ColorPalette.lightBackgroundHeaderColor,
        fontFamily: customFont,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: ColorPalette.lightOnBackgroundColor,
        fontFamily: customFont,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: ColorPalette.lightOnBackgroundColor,
        fontFamily: customFont,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: ColorPalette.lightOnBackgroundColor,
        fontFamily: customFont,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorPalette.darkBackgroundColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorPalette.darkPrimaryColor,
      onPrimary: ColorPalette.darkOnPrimaryColor,
      secondary: ColorPalette.darkSecondaryColor,
      onSecondary: ColorPalette.darkOnSecondaryColor,
      background: ColorPalette.darkBackgroundColor,
      onBackground: ColorPalette.darkOnBackgroundColor,
      surface: ColorPalette.darkSurfaceColor,
      onSurface: ColorPalette.darkOnSurfaceColor,
      error: Colors.red,
      onError: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorPalette.darkSecondaryColor,
      foregroundColor: ColorPalette.darkOnSecondaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: ColorPalette.darkAppBarColor,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ColorPalette.darkSnackBar,
    ),
    iconTheme: IconThemeData(
      color: ColorPalette.darkIconColor,
      size: iconSize,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 33,
        color: ColorPalette.darkBackgroundHeaderColor,
        fontFamily: customFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        color: ColorPalette.darkBackgroundHeaderColor,
        fontFamily: customFont,
      ),
      headlineSmall: TextStyle(
        fontSize: 21,
        color: ColorPalette.darkBackgroundHeaderColor,
        fontFamily: customFont,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: ColorPalette.darkOnBackgroundColor,
        fontFamily: customFont,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: ColorPalette.darkOnBackgroundColor,
        fontFamily: customFont,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: ColorPalette.darkOnBackgroundColor,
        fontFamily: customFont,
      ),
    ),
  );
}
