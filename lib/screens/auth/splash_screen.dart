/*
 * Created by Usmanov Eldor on 5/6/21, 10:58 AM
 *  Copyright (c) 6/5/2021
 *  Last modified 5/6/21, 10:49 AM
 *  2021 © SICNT. All rights reserved.
 */

import 'dart:async';
import 'package:charity_app/screens/auth/welcome_screen.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
        builder: (BuildContext context) => WelcomeScreen()),
    (Route<dynamic> route) => false,);
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
