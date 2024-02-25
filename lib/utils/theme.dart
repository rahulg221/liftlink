import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/utils/color_palette.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorPalette.lightBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalette.lightSecondaryColor,
    foregroundColor: ColorPalette.lightSecondaryTextColor,
  ),
  appBarTheme: AppBarTheme(
    color: ColorPalette.lightAppBarColor,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: ColorPalette.lightSurfaceColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 35,
      color: ColorPalette.lightBackgroundHeaderColor,
      fontWeight: FontWeight.bold,
      fontFamily: customFont,
    ),
    headlineMedium: TextStyle(
      fontSize: 27,
      color: ColorPalette.lightBackgroundHeaderColor,
      fontWeight: FontWeight.bold,
      fontFamily: customFont,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      color: ColorPalette.lightBackgroundHeaderColor,
      fontWeight: FontWeight.bold,
      fontFamily: customFont,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: ColorPalette.lightBackgroundTextColor,
      fontFamily: customFont,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: ColorPalette.lightBackgroundTextColor,
      fontFamily: customFont,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: ColorPalette.lightBackgroundTextColor,
      fontFamily: customFont,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorPalette.darkBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalette.darkSecondaryColor,
    foregroundColor: ColorPalette.darkSecondaryTextColor,
  ),
  appBarTheme: AppBarTheme(
    color: ColorPalette.darkAppBarColor,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: ColorPalette.darkSurfaceColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 35,
      color: ColorPalette.darkBackgroundHeaderColor,
      fontWeight: FontWeight.bold,
      fontFamily: customFont,
    ),
    headlineMedium: TextStyle(
      fontSize: 27,
      color: ColorPalette.darkBackgroundHeaderColor,
      fontWeight: FontWeight.bold,
      fontFamily: customFont,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      color: ColorPalette.darkBackgroundHeaderColor,
      fontWeight: FontWeight.bold,
      fontFamily: customFont,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: ColorPalette.darkBackgroundTextColor,
      fontFamily: customFont,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: ColorPalette.darkBackgroundTextColor,
      fontFamily: customFont,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: ColorPalette.darkBackgroundTextColor,
      fontFamily: customFont,
    ),
  ),
);
