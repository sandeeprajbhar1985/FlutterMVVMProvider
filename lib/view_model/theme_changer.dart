import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  setIsDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setThemeMode(mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
