import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ColorPalette {
  // Custom colors
  static Color coral = const Color.fromARGB(255, 255, 94, 94);
  static Color lightCoral = const Color.fromARGB(255, 255, 86, 86);
  static Color lightBlue = const Color.fromARGB(255, 90, 186, 238);
  static Color teal = const Color.fromARGB(255, 26, 255, 202);
  // Background colors prev. 18 18 18
  static Color darkBackgroundColor = Colors.black;
  static Color lightBackgroundColor = const Color.fromARGB(255, 255, 253, 247);
  // App bar colors
  static Color darkAppBarColor = darkBackgroundColor;
  static Color lightAppBarColor = lightBackgroundColor;
  // Nav bar colors
  static Color darkNavBarColor = darkPrimaryColor.withOpacity(0.2);
  static Color lightNavBarColor = lightPrimaryColor.withOpacity(0.2);
  // Surface colors
  static Color darkSurfaceColor = const Color.fromARGB(255, 19, 19, 19);
  static Color lightSurfaceColor = const Color.fromARGB(255, 243, 239, 231);
  // Primary colors
  static Color darkPrimaryColor = coral;
  static Color lightPrimaryColor = coral;
  // Secondary colors
  static Color darkSecondaryColor = teal;
  static Color lightSecondaryColor = teal;
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
  static Color darkOnSecondaryColor = Colors.white;
  static Color lightOnSecondaryColor = Colors.white;
  // Default icon color
  static Color darkIconColor = darkOnBackgroundColor.withOpacity(0.7);
  static Color lightIconColor = const Color.fromARGB(255, 18, 18, 18);
  // Snack bar colors
  static Color darkSnackBar = const Color.fromARGB(255, 40, 40, 40);
  static Color lightSnackBar = const Color.fromARGB(255, 174, 174, 174);
}

class ThemeConfig {
  static ThemeData lightTheme(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = width / 500;

    return ThemeData(
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
        size: iconSize * scaleFactor,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30 * scaleFactor,
          color: ColorPalette.lightBackgroundHeaderColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 600),
          ],
        ),
        headlineMedium: TextStyle(
          fontSize: 25 * scaleFactor,
          color: ColorPalette.lightBackgroundHeaderColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 600),
          ],
        ),
        headlineSmall: TextStyle(
          fontSize: 23 * scaleFactor,
          color: ColorPalette.lightBackgroundHeaderColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 600),
          ],
        ),
        bodyLarge: TextStyle(
          fontSize: 21 * scaleFactor,
          color: ColorPalette.lightOnBackgroundColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 400),
          ],
        ),
        bodyMedium: TextStyle(
          fontSize: 19 * scaleFactor,
          color: ColorPalette.lightOnBackgroundColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 400),
          ],
        ),
        bodySmall: TextStyle(
          fontSize: 17 * scaleFactor,
          color: ColorPalette.lightOnBackgroundColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 400),
          ],
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = width / 500;

    return ThemeData(
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
        thumbColor:
            MaterialStateProperty.all(ColorPalette.darkOnBackgroundColor),
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
        size: iconSize * scaleFactor,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 30 * scaleFactor,
          color: ColorPalette.darkBackgroundHeaderColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 600),
          ],
        ),
        headlineMedium: TextStyle(
          fontSize: 25 * scaleFactor,
          color: ColorPalette.darkBackgroundHeaderColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 600),
          ],
        ),
        headlineSmall: TextStyle(
          fontSize: 23 * scaleFactor,
          color: ColorPalette.darkBackgroundHeaderColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 600),
          ],
        ),
        bodyLarge: TextStyle(
          fontSize: 21 * scaleFactor,
          color: ColorPalette.darkOnBackgroundColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 400),
          ],
        ),
        bodyMedium: TextStyle(
          fontSize: 19 * scaleFactor,
          color: ColorPalette.darkOnBackgroundColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 400),
          ],
        ),
        bodySmall: TextStyle(
          fontSize: 17 * scaleFactor,
          color: ColorPalette.darkOnBackgroundColor,
          fontFamily: customFont,
          fontVariations: const <FontVariation>[
            FontVariation('wght', 400),
          ],
        ),
      ),
    );
  }
}
