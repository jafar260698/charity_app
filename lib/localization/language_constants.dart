import 'package:charity_app/localization/user_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'demo_localizations.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String RUSSIAN = 'ru';
const String KAZAK = 'uz';

Future<Locale> setLocale(String languageCode) async {
  UserData _userData = UserData();
  _userData.setLang(languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "uz";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case KAZAK:
      return Locale(KAZAK, 'UZ');
    case RUSSIAN:
      return Locale(RUSSIAN, "RU");
    default:
      return Locale(KAZAK, 'UZ');
  }
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}
