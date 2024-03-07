import 'package:flutter/material.dart';
import 'package:fitness_app/utils/theme_config.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  getTheme() => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == ThemeConfig.lightTheme) {
      // If current theme is dark, switch to light.
      _themeData = ThemeConfig.darkTheme;
    } else {
      // If current theme is light, switch to dark.
      _themeData = ThemeConfig.lightTheme;
    }
    notifyListeners();
  }
}
