

import 'package:charity_app/main.dart';
import 'package:charity_app/view/components/card_icon.dart';
import 'package:charity_app/view/components/text_field_ui.dart';
import 'package:charity_app/view/screens/home/home_without_drawer_screen.dart';
import 'package:charity_app/view/screens/home/profile_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/custom/custom_service_category_expansion.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'article_screen.dart';
import 'drawer/cabinet_drawer.dart';
import 'drawer/drawer_user_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

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
          drawerWidth: MediaQuery.of(context).size.width * 0.75,
          onDrawerCall: (DrawerIndex drawerIndexdata) {
            //changeIndex(drawerIndexdata);
          },
          screenView: HomeWithoutDrawerScreen(),
        ),    ),
    );
  }

  Widget mainUI(context){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20,right: 10),
                itemCount: imgList.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imgList[index])
                        ),
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(28)
                    ),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextFieldUI(
              controller: pinfl,
              text: 'Jafar',
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.done,
              hintText: "Поиск...",
              suffixIcon: IconButton(
                splashRadius: 25,
                onPressed: () {

                },
                icon: Icon(FlevaIcons.search),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardIcon("Narusheniya", "assets/svg/services/medicine.svg"),
              CardIcon("Навыки", "assets/svg/services/skill.svg"),
              CardIcon("Ресурсы", "assets/svg/services/resource.svg")
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardIcon("Услугодатели", "assets/svg/services/service_provider.svg"),
              CardIcon("Права", "assets/svg/services/rules.svg"),
              CardIcon("Инклюзия", "assets/svg/services/inclusion.svg")
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CardIcon("Helloworld", "assets/svg/services/article.svg"),
              CardIcon("Форум", "assets/svg/services/forum.svg"),
              CardIcon("Dlya mam", "assets/svg/services/for_mummy.svg")
            ],
          ),
          SizedBox(height: 80.0)
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
      // leading: IconButton(
      //   splashRadius: 20,
      //   icon: Icon(Icons.menu_outlined),
      //   onPressed: () => {
      //      Scaffold.of(context).openDrawer(),
      //   },
      //   tooltip: MaterialLocalizations
      //       .of(
      //       context)
      //       .openAppDrawerTooltip,
      // ),
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
