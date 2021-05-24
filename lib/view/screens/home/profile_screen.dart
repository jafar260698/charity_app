


import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/auth/register_screen.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }

}