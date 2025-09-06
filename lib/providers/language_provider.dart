import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');

  Locale get locale => _locale;

  void changeLanguage(String lang) {
    if (lang == "ar") {
      _locale = const Locale('ar', 'EG');
    } else {
      _locale = const Locale('en', 'US');
    }
    notifyListeners();
  }
}
