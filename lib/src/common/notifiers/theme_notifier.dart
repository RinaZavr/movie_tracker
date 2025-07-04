import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void changeTheme({required ThemeMode themeMode}) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
