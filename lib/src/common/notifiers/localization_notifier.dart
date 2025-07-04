import 'package:flutter/material.dart';

final class LocalizationNotifier extends ChangeNotifier {
  Locale _locale = const Locale('ru', 'RU');

  Locale get locale => _locale;

  void changeLocal({required Locale locale}) {
    _locale = locale;
    notifyListeners();
  }
}
