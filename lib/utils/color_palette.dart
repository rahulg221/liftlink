import 'package:flutter/material.dart';

class ColorPalette {
  // Background colors
  static const darkBackgroundColor = Color.fromARGB(255, 18, 18, 18);
  static const lightBackgroundColor = Color.fromARGB(255, 240, 240, 240);
  // Surface colors - widgets

  // Primary colors - on surface buttons, graphs, etc
  static Color lightPrimaryColor = Colors.blue;
  static Color darkPrimaryColor = Colors.cyan;
  // Secondary colors - above surface buttons
  static Color floatingActionButtonColor = Colors.deepOrange;
  // On background text
  static Color darkBackgroundTextColor = Colors.white.withOpacity(0.7);
  static Color lightBackgroundTextColor = Colors.black;
  // On surface text
  static Color darkSurfaceTextColor = Colors.white.withOpacity(0.9);
  static Color lightSurfaceTextColor = Colors.black;
  // On primary text
  static Color darkPrimaryTextColor = Colors.black;
  static Color lightPrimaryTextColor = Colors.black;
  // On secondary text
  static Color darkSecondaryTextColor = Colors.black;
  static Color lightSecondaryTextColor = Colors.black;
}
