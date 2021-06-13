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
import 'package:charity_app/view/screens/home/faq_screen.dart';
import 'package:charity_app/view/screens/home/settings_screen.dart';
import 'package:charity_app/view/screens/other/favourite_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
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
              backgroundColor: AppColor.primary,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: SizeConfig.calculateBlockVertical(45)),
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
                        SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
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
                                  SvgPicture.asset('assets/svg/info_icon.svg',color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("О нас",style: AppThemeStyle.buttonWhite16),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          Divider(
                            height: 2,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/home_icon.svg',color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("Главная",style: AppThemeStyle.buttonWhite16),
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
                                    onTap: (){},
                                    child: Text("Диагнозы",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell(
                                    onTap: (){},
                                    child: Text("Навыки",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell( onTap: (){},
                                    child: Text("Ресурсы",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell(
                                    onTap: (){},
                                    child: Text("Услугодатели",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell(
                                    onTap: (){},
                                    child: Text("Права",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell(
                                    onTap: (){},
                                    child: Text("Инклюзия",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell(
                                    onTap: (){},
                                    child: Text("Статьи",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell(
                                    onTap: (){},
                                      child: Text("Форум",style: AppThemeStyle.buttonWhite16)),
                                SizedBox(height: 10),
                                InkWell( onTap: (){ },child: Text("Ссылки",style: AppThemeStyle.buttonWhite16)),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(12)),
                          Divider(
                            height: 2,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(20)),
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
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FaqScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/question_icon.svg',color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("FAQ",style: AppThemeStyle.buttonWhite16,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/settings_icon.svg',color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("Настройки",style: AppThemeStyle.buttonWhite16,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          InkWell(
                            onTap: (){
                              _modalInfo(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/exit_icon.svg',color: Colors.white),
                                  SizedBox(width: 10),
                                  Text("Выйти",style: AppThemeStyle.buttonWhite16,),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                        ],
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
