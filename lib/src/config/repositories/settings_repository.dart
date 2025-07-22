import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  SettingsRepository({required this.prefs});

  final SharedPreferences prefs;

  final String localeKey = 'locale';

  final String themeKey = 'theme';

  // Сохранить язык
  Future<void> saveLocale(Locale locale) async {
    await prefs.setString(localeKey, locale.languageCode);
  }

  // Получить язык
  Locale getLocale() {
    final locale = prefs.getString(localeKey) ?? 'ru';
    return Locale(locale, locale.toUpperCase());
  }

  // Сохранить тему

  Future<void> saveTheme(ThemeMode mode) async {
    await prefs.setString(themeKey, mode.name);
  }

  // Получить тему
  ThemeMode getTheme() {
    final theme = prefs.getString(themeKey) ?? ThemeMode.system.name;
    return ThemeMode.values.firstWhere((element) => element.name == theme);
  }
}
