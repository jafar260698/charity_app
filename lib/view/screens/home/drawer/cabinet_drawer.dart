/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 5/3/21 4:39 PM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/28/21 9:29 AM
 *
 *
 */

import 'package:charity_app/view/screens/home/profile/profile_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 45),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:70.0),
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

                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/svg/sending.svg',color: Colors.white,),
                                    SizedBox(width: 10),
                                    Text("О нас",style: AppThemeStyle.buttonWhite16,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Divider(
                              height: 2,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            SizedBox(height: 12),
                            inkWell(Icons.home_outlined, "Главная"),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30,10,10,10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Диагнозы",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 34),
                                  Text("Навыки",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 14),
                                  Text("Ресурсы",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 14),
                                  Text("Услугодатели",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 14),
                                  Text("Права",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 14),
                                  Text("Инклюзия",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 14),
                                  Text("Статьи",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 14),
                                  Text("Форум",style: AppThemeStyle.buttonWhite16,),
                                  SizedBox(width: 14),
                                  Text("Ссылки",style: AppThemeStyle.buttonWhite16,),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Divider(
                              height: 2,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            SizedBox(height: 20),
                            inkWell(Icons.bookmark_outline, "Избранное"),
                            SizedBox(height: 20),
                            inkWell(Icons.settings, "FAQ"),
                            SizedBox(height: 20),
                            inkWell(Icons.settings, "Настройки"),
                            SizedBox(height: 20),
                            inkWell(Icons.logout, "Выйти"),
                            SizedBox(height: 80),
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


  Widget inkWell(IconData icon,String title){
    return InkWell(
      onTap: (){

      },
      child: Padding(
        padding: EdgeInsets.only(top: 3,bottom: 3,left: 10,right: 10),
        child: Row(
          children: [
            Icon(icon,color: Colors.white),
            SizedBox(width: 10),
            Text(title,style: AppThemeStyle.buttonWhite16),
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
