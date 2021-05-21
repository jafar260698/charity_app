import 'package:charity_app/service/network_service.dart';
import 'package:charity_app/service/network_status.dart';
import 'package:charity_app/view/screens/auth/splash_screen.dart';
import 'package:charity_app/view/theme/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

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
          AppTheme(
              id: 'light', data: MyThemes.lightTheme, description: 'light'),
          AppTheme(id: 'dark', data: MyThemes.darkTheme, description: 'dark'),
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
              controller.setTheme('dark');
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
            ),
          ),
        ),
      ),
    );
  }
}
