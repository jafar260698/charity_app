
import 'package:charity_app/components/btn_ui.dart';
import 'package:charity_app/screens/permission_for_notification.dart';
import 'package:charity_app/theme/themes.dart';
import 'package:charity_app/widgets/app_bar_auth.dart';
import 'package:charity_app/widgets/custom/getWidgetLogoHorizontal.dart';
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
    return Scaffold(
      appBar: widgetAppBarTitle(context),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SafeArea(
                child: Column(
                  children: [
                    getWidgetLogoHorizontal,
                    Text(
                      'Создать аккаунт',
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
        ],
      ),
    );
  }

}