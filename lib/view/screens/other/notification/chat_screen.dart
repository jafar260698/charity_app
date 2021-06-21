

import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: IconButton(
                iconSize: 18.0,
                splashRadius: 20,
                icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AvatarImage(
                        imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',
                        size: 50.0),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Бибигуль Ахметова",
                        textAlign: TextAlign.start,
                        style: AppThemeStyle.listStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(20)),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      MessageTime(align: Alignment.center,text:"13 декабря 2020"),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      Message(align: Alignment.topLeft,color: Color.fromRGBO(237, 247, 255, 1),text:
                          "Хороший репортаж,думаю многие не знают,"
                          " что в Москве есть такая клиника, хоть в "
                          "газете прочтут. Дети -прелесть! Здоровья им"),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      Message(align: Alignment.topRight,color: Color.fromRGBO(229, 255, 243, 1),text: "Хороший репортаж,думаю, многие не знают, что в Москве",),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      MessageTime(align: Alignment.center,text:"1 февраля"),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      Message(align: Alignment.topLeft,color: Color.fromRGBO(237, 247, 255, 1),text:"Тоже"),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      Message(align: Alignment.topLeft,color: Color.fromRGBO(237, 247, 255, 1),text:"Дали"),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      Message(align: Alignment.topLeft,color: Color.fromRGBO(237, 247, 255, 1),text:"Это была шутка"),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      Message(align: Alignment.topRight,color: Color.fromRGBO(229, 255, 243, 1),text: "Хороший репортаж,думаю, многие не знают, что в Москве",),
                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      Message(align: Alignment.topLeft,color: Color.fromRGBO(237, 247, 255, 1),text:"Хороший репортаж, думаю, "
                          "многие не знают, что в Москве "
                          "есть такая клиника, хоть в газете прочтут. Дети -"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message extends StatelessWidget{
  Alignment align;
  String text;
  Color color;

  Message({
   this.align,
   this.text,
   this.color
 });

  @override
  Widget build(BuildContext context) {
    if(text.length<33)
      return Align(
      alignment: align,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
      //  width: SizeConfig.screenWidth*0.7,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(text,
            style: AppThemeStyle.title14,
          ),
        ),
      ),
    );
    else {
      return Align(
        alignment: align,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          width: SizeConfig.screenWidth*0.7,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(text,
              style: AppThemeStyle.title14,
            ),
          ),
        ),
      );
    }
  }

}

class MessageTime extends StatelessWidget{
  Alignment align;
  String text;

   MessageTime({
        this.align,
        this.text
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}
