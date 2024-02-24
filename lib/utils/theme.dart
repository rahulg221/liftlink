import 'package:flutter/material.dart';
import 'package:fitness_app/utils/color_palette.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: ColorPalette.lightBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalette.floatingActionButtonColor,
  ),
  appBarTheme: AppBarTheme(
    color: ColorPalette.lightBackgroundColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 26,
      color: ColorPalette.lightBackgroundTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      color: ColorPalette.lightBackgroundTextColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      color: ColorPalette.lightBackgroundTextColor,
    ),
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorPalette.lightBackgroundColor,
    selectedItemColor: ColorPalette.lightPrimaryColor,
    unselectedItemColor: Colors.grey,
  ),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: ColorPalette.darkBackgroundColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: const Color.fromARGB(255, 255, 122, 81),
  ),
  appBarTheme: AppBarTheme(
    color: ColorPalette.darkBackgroundColor,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 26,
      color: ColorPalette.darkBackgroundTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      color: ColorPalette.darkBackgroundTextColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      color: ColorPalette.darkBackgroundTextColor,
    ),
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorPalette.darkBackgroundColor,
    selectedItemColor: ColorPalette.darkPrimaryColor,
    unselectedItemColor: Colors.grey.shade800,
  ),
);
