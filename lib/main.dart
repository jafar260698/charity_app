import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/providers/locator.dart';
import 'package:charity_app/service/network_service.dart';
import 'package:charity_app/service/network_status.dart';
import 'package:charity_app/view/screens/auth/splash_screen.dart';
import 'package:charity_app/view/theme/my_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'localization/demo_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp( MyApp(),),
  );
}

class MyApp extends StatefulWidget{
  const MyApp({Key key}) : super(key: key);


  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<NetworkStatus>(
      initialData: NetworkStatus.Offline,
      create: (context) => NetworkService().networkStatusController.stream,
      child: ThemeProvider(
        defaultThemeId: 'light',
        themes: <AppTheme>[
          AppTheme(id: 'light', data: MyThemes.lightTheme, description: 'light'),
          AppTheme(id: 'dark', data: MyThemes.lightTheme, description: 'dark'),
        ],
        saveThemesOnChange: true,
        loadThemeOnInit: false,
        // Do not load the saved view.theme(use onInitCallback callback)
        onInitCallback: (controller, previouslySavedThemeFuture) async {
          String savedTheme = await previouslySavedThemeFuture;

          if (savedTheme != null) {
            // If previous view.theme saved, use saved view.theme
            controller.setTheme(savedTheme);
          } else {
            // If previous view.theme not found, use platform default
            Brightness platformBrightness =
                SchedulerBinding.instance.window.platformBrightness;
            if (platformBrightness == Brightness.dark) {
              controller.setTheme('light');
            } else {
              controller.setTheme('light');
            }
            // Forget the saved view.theme(which were saved just now by previous lines)
            controller.forgetSavedTheme();
          }
        },
        child: ThemeConsumer(
          child: Builder(
            builder: (themeContext) => MaterialApp(
              theme: ThemeProvider.themeOf(themeContext).data,
              debugShowCheckedModeBanner: false,
              title: 'Charity App',
              home: SplashScreen(),
              locale: _locale,
              supportedLocales: [
                Locale('uz', 'UZ'),
                Locale('ru', 'RU'),
              ],
              localizationsDelegates: [
                DemoLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                  print(supportedLocale);
                }
                return supportedLocales.first;
              },
            ),
          ),
        ),
      ),
    );
  }
}
