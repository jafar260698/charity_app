
import 'package:charity_app/components/btn_ui.dart';
import 'package:charity_app/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/get_widget_family.dart';
import '../widgets/get_widget_logo.dart';
import 'access_via_social_media_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    getWidgetLogoVertical,
                    SizedBox(height: 20),
                    getWidgetLogo
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                SvgPicture.asset('assets/svg/welcome.svg'),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Еще нет акаунта? Зарегистрироваться сейчас!',
                    style: AppThemeStyle.text14_600,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}