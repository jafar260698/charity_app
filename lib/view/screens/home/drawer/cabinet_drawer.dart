/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 5/3/21 4:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/28/21 9:29 AM
 *
 *
 */

import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/bottom_modal_sheet.dart';
import 'package:charity_app/view/screens/home/faq.dart';
import 'package:charity_app/view/screens/home/settings_screen.dart';
import 'package:charity_app/view/screens/other/favourite_screen.dart';
import 'package:charity_app/view/screens/home/profile/profile_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:charity_app/view/widgets/exit_modal_view.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';
import 'cabinet_drawer_viewmodel.dart';

class CabinetDrawer extends StatelessWidget {
  const CabinetDrawer(
      {Key key,
      this.screenIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CabinetDrawerViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: Color.fromRGBO(98, 190, 184, 1),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 45),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 30),
                            AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:70.0),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Бибигуль\n Ахметова",
                                textAlign: TextAlign.start,
                                style: AppThemeStyle.listStyle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FaqScreen()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/sending.svg',color: Colors.white,),
                                    SizedBox(width: 10),
                                    Text("О нас",style: AppThemeStyle.buttonWhite16,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Divider(
                              height: 2,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: (){

                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                                child: Row(
                                  children: [
                                    Icon(Ionicons.home_outline,color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Главная",style: AppThemeStyle.buttonWhite16,),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 35,top: 10,bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: Text("Диагнозы",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: Text("Навыки",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell( onTap: (){},
                                      child: Text("Ресурсы",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: Text("Услугодатели",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: Text("Права",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: Text("Инклюзия",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell(
                                      onTap: (){

                                      },
                                      child: Text("Статьи",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell(
                                      onTap: (){

                                      },
                                        child: Text("Форум",style: AppThemeStyle.buttonWhite16,)),
                                  SizedBox(height: 10),
                                  InkWell( onTap: (){

                                  },child: Text("Ссылки",style: AppThemeStyle.buttonWhite16,)),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Divider(
                              height: 2,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteScreen()));

                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                                child: Row(
                                  children: [
                                    Icon(FlevaIcons.bookmark_outline,color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("Избранное",style: AppThemeStyle.buttonWhite16,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FaqScreen()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.settings,color: Colors.white),
                                    SizedBox(width: 10),
                                    Text("FAQ",style: AppThemeStyle.buttonWhite16,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height:5),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.settings,color: Colors.white,),
                                    SizedBox(width: 10),
                                    Text("Настройки",style: AppThemeStyle.buttonWhite16,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: (){
                                _modalInfo(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.logout,color: Colors.white,),
                                    SizedBox(width: 10),
                                    Text("Выйти",style: AppThemeStyle.buttonWhite16,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        onModelReady: (model) => model.initContext(context),
        viewModelBuilder: () => CabinetDrawerViewModel());
  }

  void _modalInfo(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (builder) {
        return BottomModalSheet(
          child: Wrap(
            children: [
              ExitModalView(
                onTapExit: () {

                },
              ),
            ],
          ),
        );
      },
    );
  }



  Widget inkwell(DrawerList listData, CabinetDrawerViewModel model) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 10.0,
                    height: SizeConfig.calculateBlockVertical(44),
                    decoration: BoxDecoration(
                      color: screenIndex == listData.index
                          ? model.backHeaderColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  listData.isAssetsImage
                      ? Container(
                          width: SizeConfig.calculateBlockHorizontal(20),
                          height: SizeConfig.calculateBlockHorizontal(20),
                          child: SvgPicture.asset(listData.svgName,
                              color: screenIndex == listData.index
                                  ? Colors.red
                                  : Colors.blueAccent),
                        )
                      : Icon(listData.icon.icon,
                          color: screenIndex == listData.index
                              ? Colors.red
                              : Colors.blueAccent),
                  SizedBox(width: SizeConfig.calculateBlockHorizontal(16)),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.calculateTextSize(16),
                      color: screenIndex == listData.index
                          ? Colors.white
                          : Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            screenIndex == listData.index
                ? AnimatedBuilder(
                    animation: iconAnimationController,
                    builder: (BuildContext context, Widget child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 - iconAnimationController.value - 1.1),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 20,
                            height: SizeConfig.calculateBlockVertical(46),
                            decoration: BoxDecoration(
                              color: model.backHeaderColor?.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(26),
                                bottomRight: Radius.circular(26),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    callBackIndex(indexScreen);
  }

}

enum DrawerIndex {
  HOME,
  Services,
  Help,
  Share,
  Message,
  Settings,
  About,
  Calendar,
  Report
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.svgName,
  });

  String labelName;
  Icon icon;
  bool isAssetsImage;
  String svgName;
  DrawerIndex index;
}
