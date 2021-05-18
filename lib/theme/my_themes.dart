import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

const MaterialColor primary = const MaterialColor(
  0xff325ECD,
  const <int, Color>{
    50: const Color(0xff325ECD),
    100: const Color(0xff325ECD),
    200: const Color(0xff325ECD),
    300: const Color(0xff325ECD),
    400: const Color(0xff325ECD),
    500: const Color(0xff325ECD),
    600: const Color(0xff325ECD),
    700: const Color(0xff325ECD),
    800: const Color(0xff325ECD),
    900: const Color(0xff325ECD),
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
    primaryColor: Color(0xff325ECD),
    accentColor: Color(0xff325ECD),
    backgroundColor: Color(0xffF6F6FA),
    scaffoldBackgroundColor: Color(0xffF6F6FA),
    cardColor: Color(0xffFFFFFF),
    focusColor: Color(0xff325ECD),
    bottomAppBarColor: Color(0xff325ECD),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: Color(0xff325ECD),
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xff282F38),
    ),
    cursorColor: Color(0xff2E2F40),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Montserrat',
    primarySwatch: primary,
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Color(0xff17222C),
    ),
    primaryColor: Color(0xff325ECD),
    backgroundColor: Color(0xff17222C),
    scaffoldBackgroundColor: Color(0xff17222C),
    accentColor: Color(0xff325ECD),
    cardColor: Color(0xff253442),
    bottomSheetTheme: BottomSheetThemeData(
      modalBackgroundColor: Color(0xff17222C),
    ),
    focusColor: Color(0xff325ECD),
    cupertinoOverrideTheme: CupertinoThemeData(
      barBackgroundColor: Color(0xff253442),
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xffEFEFEF),
    ),
  );
}
