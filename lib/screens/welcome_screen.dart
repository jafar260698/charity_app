
import 'package:charity_app/components/btn_ui.dart';
import 'package:charity_app/screens/access_via_social_media_screen.dart';
import 'package:charity_app/widgets/get_widget_family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/get_widget_logo.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/main_back.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SafeArea(
                    child: Column(
                        children: [
                          SizedBox(height: 70),
                          getWidgetLogoVertical,
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 35,right: 35),
                              child: getWidgetLogo
                          )
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
                    SizedBox(height:8),
                    BtnUI(
                      height: 55,
                      isLoading: false,
                      textColor: Colors.white,
                      color: Color.fromRGBO(98, 190, 184, 1),
                      text: 'Qozoq tili',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccessViaSocialMediaScreen()));
                      },
                    ),
                    SizedBox(height:8),
                    BtnUI(
                      height: 55,
                      isLoading: false,
                      textColor: Colors.white,
                      color: Color.fromRGBO(98, 190, 184, 1),
                      text: 'Rus tili',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccessViaSocialMediaScreen()));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}