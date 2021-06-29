

import 'package:charity_app/view/screens/home/home_without_drawer_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'drawer/cabinet_drawer.dart';
import 'drawer/drawer_user_controller.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  DrawerIndex drawerIndex;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) =>  SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.80,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              //changeIndex(drawerIndexdata);
            },
            username: model.username,
            screenView: HomeWithoutDrawerScreen(),
          ),    ),
      ),
      onModelReady: (model){
        model.initData();
        model.getCategory();
      },
      viewModelBuilder: () => HomeViewModel(),
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
