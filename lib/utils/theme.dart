import 'package:fitness_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/utils/color_palette.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorPalette.lightBackgroundColor,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: ColorPalette.lightPrimaryColor,
    onPrimary: ColorPalette.lightPrimaryTextColor,
    secondary: ColorPalette.lightSecondaryColor,
    onSecondary: ColorPalette.lightPrimaryTextColor,
    background: ColorPalette.lightBackgroundColor,
    onBackground: ColorPalette.lightBackgroundTextColor,
    surface: ColorPalette.lightSurfaceColor,
    onSurface: ColorPalette.lightSurfaceTextColor,
    error: Colors.red,
    onError: Colors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalette.lightSecondaryColor,
    foregroundColor: ColorPalette.lightSecondaryTextColor,
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
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: ColorPalette.darkPrimaryColor,
    onPrimary: ColorPalette.darkPrimaryTextColor,
    secondary: ColorPalette.darkSecondaryColor,
    onSecondary: ColorPalette.darkPrimaryTextColor,
    background: ColorPalette.darkBackgroundColor,
    onBackground: ColorPalette.darkBackgroundTextColor,
    surface: ColorPalette.darkSurfaceColor,
    onSurface: ColorPalette.darkSurfaceTextColor,
    error: Colors.red,
    onError: Colors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalette.darkSecondaryColor,
    foregroundColor: ColorPalette.darkSecondaryTextColor,
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
