
import 'dart:ui';
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/localization/user_data.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class Utils{

  static void changeLanguage(BuildContext context, String language) async {
    UserData userData = UserData();
    userData.setLang(language);
    Locale _locale = await setLocale(language);
    MyApp.setLocale(context, _locale);
  }

}