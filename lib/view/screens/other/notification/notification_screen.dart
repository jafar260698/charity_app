import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/column_message.dart';
import 'package:charity_app/view/components/search_field_ui.dart';
import 'package:charity_app/view/screens/other/notification/chat_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {
  var _currentIndex = 0;
  TextEditingController pinfl = new TextEditingController();

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
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AvatarImage(
                      imageUrl:
                          'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',
                      size: 70.0),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Бибигуль \nАхметова",
                      textAlign: TextAlign.start,
                      style: AppThemeStyle.listStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(10)),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
              child: SearchFieldUI(
                controller: pinfl,
                text: '',
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.done,
                hintText: "Поиск...",
                suffixIcon: IconButton(
                  splashRadius: 25,
                  onPressed: () {},
                  icon: Icon(FlevaIcons.search),
                ),
              ),
            ),
            mainUI(_currentIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        // new
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail_outline),
            title: new Text('Личное', style: AppThemeStyle.text14_600),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/sending.svg'),
            title: new Text(
              'Комментарии',
              style: AppThemeStyle.text14_600,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              title: Text('Форум', style: AppThemeStyle.text14_600))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget mainUI(int index) {
    switch (index) {
      case 0:
        {
          return private();
        }
        break;
      case 1:
        {
          return comment();
        }
        break;
      case 2:
        {
          return forum();
        }
        break;
      default:
        {
          return private();
        }
        break;
    }
  }

  Widget private() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ColumnMessage(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            title: "",
            badge: "",
            description: "",
            time: "",
            imageUrl: "",
            isVisible: true,
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(20)),
          ColumnMessage(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            title: "",
            badge: "",
            description: "",
            time: "",
            imageUrl: "",
            isVisible: true,
          ),
        ],
      ),
    );
  }

  Widget forum() {
    return Expanded(
      child: ListView(
        children: [
          Column(
            children: [
              ColumnMessage(
                onTap: (){

                },
                title: "",
                badge: "",
                description: "",
                time: "",
                imageUrl: "",
                isVisible: false,
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(20)),
              ColumnMessage(
                onTap: (){

                },
                title: "",
                badge: "",
                description: "",
                time: "",
                imageUrl: "",
                isVisible: true,
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(20)),
              ColumnMessage(
                onTap: (){

                },
                title: "",
                badge: "",
                description: "",
                time: "",
                imageUrl: "",
                isVisible: true,
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(20)),
              ColumnMessage(
                onTap: (){

                },
                title: "",
                badge: "",
                description: "",
                time: "",
                imageUrl: "",
                isVisible: false,
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget comment() {
    return Align(
        alignment: Alignment.center,
        child: Text("У вас пока нет комментариев",
            style: AppThemeStyle.subtitleList2));
  }
}
