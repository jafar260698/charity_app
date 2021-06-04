

import 'package:charity_app/view/screens/home/home_without_drawer_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'drawer/cabinet_drawer.dart';
import 'drawer/drawer_user_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  TextEditingController pinfl = new TextEditingController();
  DrawerIndex drawerIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: DrawerUserController(
          screenIndex: drawerIndex,
          drawerWidth: MediaQuery.of(context).size.width * 0.80,
          onDrawerCall: (DrawerIndex drawerIndexdata) {
            //changeIndex(drawerIndexdata);
          },
          screenView: HomeWithoutDrawerScreen(),
        ),    ),
    );
  }


  Widget customAppbar(BuildContext context){
    return AppBar(
      title: Text(
        '',
        style: AppThemeStyle.appBarStyle,
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: SvgPicture.asset('assets/svg/Icon_notification_outline.svg',height: 24,width: 24),
        )
      ],
    );
  }

}
