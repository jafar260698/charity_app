
import 'package:charity_app/widgets/get_widget_family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(
                child: Center(
                  child: getWidgetLogo,
                ),
              ),
              CupertinoActivityIndicator(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "getTranslated(context, 'copyright')",
                textScaleFactor: 1.0,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontFamily: 'Montserrat'),
              ),
            ),
          ),
        ],
      ),
    );
  }

}