
import 'dart:async';
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/auth/welcome_screen.dart';
import 'package:charity_app/view/screens/home/bottom_navigation.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/my_themes.dart';
import 'package:charity_app/view/widgets/get_widget_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  UserData userData=new UserData();

  startTime(bool success) {
       var _duration = new Duration(seconds: 3);
      return new Timer(_duration, nextToScreen);
  }

  @override
  void initState() {
    super.initState();
    startTime(true);
  }

  void nextToScreen(){
    userData.isFirstTime().then((value) => {
      if(value){
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => WelcomeScreen()),
          (Route<dynamic> route) => false,),
      }else{
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => BottomNavigation()),
          (Route<dynamic> route) => false),
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                child: Center(
                  child: SvgPicture.asset('assets/svg/logo_vertical.svg',width: SizeConfig.calculateBlockHorizontal(100),height: SizeConfig.calculateBlockVertical(80),color: AppColor.primary),
                ),
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(32.0)),
              CupertinoActivityIndicator(),
            ],
          ),

          //copyright
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                getTranslated(context, 'copyright'),
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
