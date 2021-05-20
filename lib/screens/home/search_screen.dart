


import 'package:charity_app/components/btn_ui.dart';
import 'package:charity_app/screens/register_screen.dart';
import 'package:charity_app/theme/themes.dart';
import 'package:charity_app/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SafeArea(
                child: Column(
                  children: [
                    getWidgetLogoHorizontal,
                    Text(
                      'Вход',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'E-MAIL',
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'E-MAIL',
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    Text(
                      'Забыли пароль',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
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
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                SvgPicture.asset('assets/svg/welcome.svg',height: 200,),
                SizedBox(height: 10),
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

  Widget customAppbar(BuildContext context){
    return AppBar(
      title: Text(
        '',
        style: AppThemeStyle.appBarStyle,
      ),
      leading: IconButton(
        splashRadius: 20,
        icon: Icon(Icons.menu_outlined),
        onPressed: () => {

        },
      ),
      elevation: 0,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: SvgPicture.asset('assets/svg/Icon_notification_outline.svg')
        )
      ],
    );
  }

}