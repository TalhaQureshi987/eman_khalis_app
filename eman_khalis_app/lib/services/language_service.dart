import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppLanguage { english, urdu, arabic }

class LanguageService extends ChangeNotifier {
  AppLanguage _currentLanguage = AppLanguage.english;

  AppLanguage get currentLanguage => _currentLanguage;
  Locale get locale {
    switch (_currentLanguage) {
      case AppLanguage.urdu:
        return const Locale('ur', 'PK');
      case AppLanguage.arabic:
        return const Locale('ar', 'SA');
      case AppLanguage.english:
        return const Locale('en', 'US');
    }
  }

  TextDirection get textDirection {
    switch (_currentLanguage) {
      case AppLanguage.urdu:
      case AppLanguage.arabic:
        return TextDirection.rtl;
      case AppLanguage.english:
        return TextDirection.ltr;
    }
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('app_language') ?? 'en';
    switch (languageCode) {
      case 'ur':
        _currentLanguage = AppLanguage.urdu;
        break;
      case 'ar':
        _currentLanguage = AppLanguage.arabic;
        break;
      case 'en':
      default:
        _currentLanguage = AppLanguage.english;
        break;
    }
    notifyListeners();
  }

  Future<void> setLanguage(AppLanguage language) async {
    _currentLanguage = language;
    final prefs = await SharedPreferences.getInstance();
    String languageCode = 'en';
    switch (language) {
      case AppLanguage.urdu:
        languageCode = 'ur';
        break;
      case AppLanguage.arabic:
        languageCode = 'ar';
        break;
      case AppLanguage.english:
        languageCode = 'en';
        break;
    }
    await prefs.setString('app_language', languageCode);
    notifyListeners();
  }
}

