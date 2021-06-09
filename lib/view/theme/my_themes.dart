import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

const MaterialColor primary = const MaterialColor(
  0xff325ECD,
  const <int, Color>{
    50: const Color(0xffF6F6FA),
    100: const Color(0xffF6F6FA),
    200: const Color(0xffF6F6FA),
    300: const Color(0xffF6F6FA),
    400: const Color(0xffF6F6FA),
    500: const Color(0xffF6F6FA),
    600: const Color(0xffF6F6FA),
    700: const Color(0xffF6F6FA),
    800: const Color(0xffF6F6FA),
    900: const Color(0xffF6F6FA),
  },
);

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: primary,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Color(0xffF6F6FA),
    ),
    primaryColor: Color.fromRGBO(98, 190, 184, 1),
    accentColor: Color(0xff325ECD),
    backgroundColor: Color(0xffF6F6FA),
    scaffoldBackgroundColor: Color(0xffF6F6FA),
    cardColor: Color(0xffFFFFFF),
    focusColor: Color(0xff325ECD),
    bottomAppBarColor: Color.fromRGBO(98, 190, 184, 1),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Color.fromRGBO(98, 190, 184, 1),
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xff282F38),
    ),
    cursorColor: Color(0xff2E2F40),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: primary,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Color(0xffF6F6FA),
    ),
    primaryColor: Color.fromRGBO(98, 190, 184, 1),
    accentColor: Color(0xff325ECD),
    backgroundColor: Color(0xffF6F6FA),
    scaffoldBackgroundColor: Color(0xffF6F6FA),
    cardColor: Color(0xffFFFFFF),
    focusColor: Color(0xff325ECD),
    bottomAppBarColor: Color.fromRGBO(98, 190, 184, 1),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Color.fromRGBO(98, 190, 184, 1),
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xff282F38),
    ),
    cursorColor: Color(0xff2E2F40),
  );
}
