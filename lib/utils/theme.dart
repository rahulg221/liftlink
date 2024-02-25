import 'package:flutter/material.dart';
import 'package:fitness_app/utils/color_palette.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorPalette.lightBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalette.lightSecondaryColor,
  ),
  appBarTheme: AppBarTheme(
    color: ColorPalette.lightAppBarColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
        fontSize: 30,
        color: ColorPalette.lightBackgroundTextColor,
        fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 28,
        color: ColorPalette.lightBackgroundTextColor,
        fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 26,
        color: ColorPalette.lightBackgroundTextColor,
        fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      fontSize: 22,
      color: ColorPalette.lightBackgroundTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color: ColorPalette.lightBackgroundTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      color: ColorPalette.lightBackgroundTextColor,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorPalette.darkBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalette.darkSecondaryColor,
  ),
  appBarTheme: AppBarTheme(
    color: ColorPalette.darkAppBarColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
        fontSize: 30,
        color: ColorPalette.darkBackgroundTextColor,
        fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 28,
        color: ColorPalette.darkBackgroundTextColor,
        fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        fontSize: 26,
        color: ColorPalette.darkBackgroundTextColor,
        fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(
      fontSize: 22,
      color: ColorPalette.darkBackgroundTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color: ColorPalette.darkBackgroundTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      color: ColorPalette.darkBackgroundTextColor,
    ),
  ),
);
