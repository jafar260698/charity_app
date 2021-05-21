
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/auth/permission_for_notification.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {

  int correctScore = 0;
  int _radioValue2 = -1;

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
    });
  }


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
              padding: EdgeInsets.only(left: 25,right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Align(
                        alignment: Alignment.center,
                        child: getWidgetLogoHorizontal
                    ),
                  ),
                  SizedBox(height: 30),
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
                      hintText: 'ИМЯ ПОЛЗОВАТEЛЯ',
                      hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                      prefixIcon: Icon(Icons.person_outline,color: Colors.white),
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
                      hintText: 'ТEЛEФОН',
                      hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                      prefixIcon: Icon(Icons.call_outlined,color: Colors.white),
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
                  SizedBox(height: 80),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'ТИП ПОЛЗОВАТEЛЯ',
                      hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                      prefixIcon: Icon(Icons.person,color: Color.fromRGBO(98, 190, 184, 1),
                      ),
                      suffixIcon: Icon(Icons.rotate_left,color: Color.fromRGBO(98, 190, 184, 1),
                      ),
                      enabledBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(98, 190, 184, 1),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: new UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: [
                        new Radio(
                          value: 0,
                          activeColor:Color.fromRGBO(98, 190, 184, 1),
                          groupValue: _radioValue2,
                          onChanged: _handleRadioValueChange2,
                        ),
                        new Text(
                          'Родител',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],),
                      Row(children: [
                        new Radio(
                          value: 1,
                          groupValue: _radioValue2,
                          activeColor:Color.fromRGBO(98, 190, 184, 1),
                          onChanged: _handleRadioValueChange2,
                        ),
                        new Text(
                          'Специалист',
                          style: new TextStyle(fontSize: 16.0),
                        )
                      ],),
                      Row(children: [
                        new Radio(
                          value: 2,
                          activeColor:Color.fromRGBO(98, 190, 184, 1),
                          groupValue: _radioValue2,
                          onChanged: _handleRadioValueChange2,
                        ),
                        new Text(
                          'Оргснизация',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],),
                    ],
                  ),
                  SizedBox(height: 30),
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
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}