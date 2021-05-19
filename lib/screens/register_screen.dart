
import 'package:charity_app/components/btn_ui.dart';
import 'package:charity_app/screens/permission_for_notification.dart';
import 'package:charity_app/theme/themes.dart';
import 'package:charity_app/widgets/app_bar_auth.dart';
import 'package:charity_app/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/get_widget_family.dart';
import '../widgets/get_widget_logo.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/register.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: widgetAppBarTitle(context),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: getWidgetLogoHorizontal
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Создать аккаунт',
                    style: TextStyle(
                      fontSize: 24.0,
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'E-MAIL',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(FlevaIcons.email_outline,color: Colors.white),
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'ПАРОЛЬ',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.lock_outline,color: Colors.white),
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'E-MAIL',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(FlevaIcons.email_outline,color: Colors.white),
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'ПАРОЛЬ',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.lock_outline,color: Colors.white),
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  BtnUI(
                    height: 55,
                    isLoading: false,
                    textColor: Colors.white,
                    color: Color.fromRGBO(98, 190, 184, 1),
                    text: 'СОЗДАТЬ',
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PermissionForNotification()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}