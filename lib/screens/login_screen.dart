
import 'package:charity_app/components/btn_ui.dart';
import 'package:charity_app/screens/register_screen.dart';
import 'package:charity_app/theme/themes.dart';
import 'package:charity_app/widgets/app_bar_auth.dart';
import 'package:charity_app/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/register_background.png"),
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
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Align(
                        alignment: Alignment.center,
                        child: getWidgetLogoHorizontal),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Вход',
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
                      hintStyle: TextStyle(color: Colors.white,fontSize: 14),
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
                      hintStyle: TextStyle(color: Colors.white,fontSize: 14),
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
                  Text(
                    'Забыли пароль',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 100),
                  BtnUI(
                    height: 55,
                    isLoading: false,
                    textColor: Colors.white,
                    color: Color.fromRGBO(98, 190, 184, 1),
                    text: 'ВХОД',
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },
                  ),
                  SizedBox(height: 50),
                  SvgPicture.asset('assets/svg/welcome.svg',height: 200),
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        'Еще нет акаунта? Зарегистрироваться сейчас!',
                        style: AppThemeStyle.text14_600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}