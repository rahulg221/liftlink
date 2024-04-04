import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ColorPalette {
  // Custom colors
  static Color coral = Color(0xFFFF6B6B);
  static Color lightBlue = Color.fromARGB(255, 43, 185, 251);
  // Background colors prev. 18 18 18
  static Color darkBackgroundColor = Colors.black;
  static Color lightBackgroundColor = Color.fromARGB(255, 250, 250, 250);
  // App bar colors
  static Color darkAppBarColor = darkBackgroundColor;
  static Color lightAppBarColor = lightBackgroundColor;
  // Nav bar colors
  static Color darkNavBarColor = darkPrimaryColor.withOpacity(0.2);
  static Color lightNavBarColor = lightPrimaryColor.withOpacity(0.2);
  // Surface colors
  static Color darkSurfaceColor = Color.fromARGB(255, 24, 24, 24);
  static Color lightSurfaceColor = Color.fromARGB(255, 240, 240, 240);
  // Primary colors
  static Color darkPrimaryColor = coral;
  static Color lightPrimaryColor = lightBlue;
  // Secondary colors
  static Color darkSecondaryColor = lightBlue;
  static Color lightSecondaryColor = lightBlue;
  // On background headers
  static Color darkBackgroundHeaderColor = Colors.white;
  static Color lightBackgroundHeaderColor = Colors.black;
  // On background
  static Color darkOnBackgroundColor = Colors.white;
  static Color lightOnBackgroundColor = Colors.black;
  // On surface
  static Color darkOnSurfaceColor = Colors.white.withOpacity(0.85);
  static Color lightOnSurfaceColor = Colors.black.withOpacity(0.85);
  // On primary
  static Color darkOnPrimaryColor = Colors.white;
  static Color lightOnPrimaryColor = Colors.white;
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
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.all(ColorPalette.lightOnBackgroundColor),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ColorPalette.lightPrimaryColor;
        }
        return ColorPalette.lightOnSurfaceColor.withOpacity(0.2);
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith(
        (final Set<MaterialState> states) {
          return ColorPalette.lightBackgroundColor;
        },
      ),
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
        fontSize: 30,
        color: ColorPalette.lightBackgroundHeaderColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: ColorPalette.lightBackgroundHeaderColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        color: ColorPalette.lightBackgroundHeaderColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: ColorPalette.lightOnBackgroundColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        color: ColorPalette.lightOnBackgroundColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: ColorPalette.lightOnBackgroundColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
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
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(ColorPalette.darkOnBackgroundColor),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return ColorPalette.darkPrimaryColor;
        }
        return ColorPalette.darkOnSurfaceColor.withOpacity(0.2);
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith(
        (final Set<MaterialState> states) {
          return ColorPalette.darkBackgroundColor;
        },
      ),
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
        fontSize: 30,
        color: ColorPalette.darkBackgroundHeaderColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 500),
        ],
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: ColorPalette.darkBackgroundHeaderColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 500),
        ],
      ),
      headlineSmall: TextStyle(
        fontSize: 21,
        color: ColorPalette.darkBackgroundHeaderColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 500),
        ],
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        color: ColorPalette.darkOnBackgroundColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: ColorPalette.darkOnBackgroundColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: ColorPalette.darkOnBackgroundColor,
        fontFamily: customFont,
        fontVariations: <FontVariation>[
          FontVariation('wght', 400),
        ],
      ),
    ),
  );
}
