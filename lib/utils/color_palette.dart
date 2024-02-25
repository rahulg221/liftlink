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
  // Surface colors - widgets
  static Color darkSurfaceColor = Colors.white.withOpacity(0.07);
  static Color lightSurfaceColor = Colors.black.withOpacity(0.07);
  // Primary colors - on normal buttons, graphs, etc
  static Color darkPrimaryColor = const Color.fromARGB(255, 173, 127, 254);
  static Color lightPrimaryColor = const Color.fromARGB(255, 159, 107, 255);
  // Secondary colors - on floating action buttons - const Color(0xFFE98DF5);
  static Color darkSecondaryColor = const Color(0xFFE98DF5);
  static Color lightSecondaryColor = const Color.fromARGB(255, 226, 96, 243);
  // On background headers
  static Color darkBackgroundHeaderColor = Colors.white;
  static Color lightBackgroundHeaderColor = Colors.black;
  // On background text
  static Color darkBackgroundTextColor = Colors.white;
  static Color lightBackgroundTextColor = Colors.black;
  // On surface text
  static Color darkSurfaceTextColor = Colors.white.withOpacity(0.7);
  static Color lightSurfaceTextColor = Colors.black.withOpacity(0.7);
  // On primary text
  static Color darkPrimaryTextColor = Colors.black;
  static Color lightPrimaryTextColor = Colors.black;
  // On secondary text
  static Color darkSecondaryTextColor = Colors.black;
  static Color lightSecondaryTextColor = Colors.black;

  // Other sign in button colors
  // Google button colors
  static Color darkGoogleButtonColor = const Color.fromARGB(255, 233, 97, 0);
  static Color lightGoogleButtonColor = const Color.fromARGB(255, 233, 97, 0);

  static Color darkGoogleTextColor = Colors.white;
  static Color lightGoogleTextColor = Colors.white;
  // Facebook button colors
  static Color darkFacebookButtonColor =
      const Color.fromARGB(255, 23, 111, 227);
  static Color lightFacebookButtonColor =
      const Color.fromARGB(255, 23, 111, 227);

  static Color darkFacebookTextColor = Colors.white;
  static Color lightFacebookTextColor = Colors.white;
  // Apple button colors
  static Color darkAppleButtonColor = Colors.white;
  static Color lightAppleButtonColor = Colors.black;

  static Color darkAppleTextColor = Colors.black;
  static Color lightAppleTextColor = Colors.white;

  // Default icon color
  static Color darkIconColor = Color.fromARGB(255, 245, 245, 245);
  static Color lightIconColor = Color.fromARGB(255, 18, 18, 18);

  // Snack bar colors
  static Color darkSnackBar = Color.fromARGB(255, 40, 40, 40);
  static Color lightSnackBar = Color.fromARGB(255, 174, 174, 174);
}
