import 'package:charity_app/service/network_service.dart';
import 'package:charity_app/service/network_status.dart';
import 'package:charity_app/theme/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<NetworkStatus>(
      initialData: NetworkStatus.Offline,
      create: (context) => NetworkService().networkStatusController.stream,
      child: ThemeProvider(
        defaultThemeId: 'light',
        themes: <AppTheme>[
          AppTheme(id: 'light', data: MyThemes.lightTheme, description: 'light'),
          AppTheme(id: 'dark', data: MyThemes.darkTheme, description: 'dark'),
        ],
        saveThemesOnChange: true,
        loadThemeOnInit: false,
        // Do not load the saved theme(use onInitCallback callback)
        onInitCallback: (controller, previouslySavedThemeFuture) async {
          String savedTheme = await previouslySavedThemeFuture;

          if (savedTheme != null) {
            // If previous theme saved, use saved theme
            controller.setTheme(savedTheme);
          } else {
            // If previous theme not found, use platform default
            Brightness platformBrightness =
                SchedulerBinding.instance.window.platformBrightness;
            if (platformBrightness == Brightness.dark) {
              controller.setTheme('dark');
            } else {
              controller.setTheme('light');
            }
            // Forget the saved theme(which were saved just now by previous lines)
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
            ),
          ),
        ),
      ),
    );
  }
}