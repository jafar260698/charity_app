
import 'dart:async';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/auth/welcome_screen.dart';
import 'package:charity_app/view/screens/home/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  UserData userData=new UserData();

  startTime(bool success) {
    var _duration = new Duration(seconds: 1);

    if (success)
      return new Timer(_duration, nextToScreen);
    else {

    }
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
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

}
