// import 'package:flutter/material.dart';
// import 'package:nopcommerce_pos_app/core/dependency_registrar/feature_dependencies.dart';
// import 'app_localization.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// const String LAGUAGE_CODE = 'languageCode';
//
// //languages code
// const String ENGLISH = 'en';
// const String ARABIC = 'ar';
//
// class AppLanguage extends ChangeNotifier {
//
//   Future<Locale> setLocale(String languageCode) async {
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     await _prefs.setString(LAGUAGE_CODE, languageCode);
//     return _locale(languageCode);
//   }
//
//   Future<Locale> getLocale() async {
//     String languageCode = await sl.get<SharedPreferences>().getString(LAGUAGE_CODE) ?? "en";
//     return _locale(languageCode);
//   }
//
//   Locale _locale(String languageCode) {
//     switch (languageCode) {
//       case ENGLISH:
//         return const Locale(ENGLISH, '');
//       case ARABIC:
//         return const Locale(ARABIC, '');
//       default:
//         return const Locale(ENGLISH, '');
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale? _appLocale = const Locale('ar');

  Locale get appLocal => _appLocale ?? const Locale("en");

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code')!);
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == const Locale("en")) {
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
    } else if (type == const Locale("ar")) {
      _appLocale = const Locale("ar");
      await prefs.setString('language_code', 'ar');
    }
    notifyListeners();
  }
}
