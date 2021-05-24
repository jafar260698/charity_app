

import 'package:auto_route/auto_route_annotations.dart';
import 'package:charity_app/view/screens/auth/splash_screen.dart';
import 'package:charity_app/view/screens/auth/welcome_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: WelcomeScreen),
  ],
)
class $AppRouter {}
