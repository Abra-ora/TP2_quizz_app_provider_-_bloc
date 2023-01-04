import 'package:flutter/material.dart';
import '../theme/theme.dart';

class ThemeManagerProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void setIsDarkMode(bool darkModeActivated) => _isDarkMode = darkModeActivated;

  late ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    ThemeNotifier();
  }

  // ignore: non_constant_identifier_names
  void ThemeNotifier() {
    if (isDarkMode) {
      print("Dark mode applied");
      _themeData = darkTheme;
      notifyListeners();
    } else {
      print("Light mode applid");
      _themeData = lightTheme;
      notifyListeners();
    }  
  }
}