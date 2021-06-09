
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,

        title: Text('', style: AppThemeStyle.appBarStyle),
        leading: IconButton(
          iconSize: 18.0,
          splashRadius: 20,
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 30),
                AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:70.0),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Бибигуль Ахметова",
                        textAlign: TextAlign.start,
                        style: AppThemeStyle.listStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Редактировать имя",
                        textAlign: TextAlign.start,
                        style: AppThemeStyle.buttonNormal,
                      ),
                      SizedBox(height: 10),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(20)),
            Divider(
              height: 2,
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(20)),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Выбор языка",
                    textAlign: TextAlign.start,
                    style: AppThemeStyle.listStyle,
                  ),
                  SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                  Divider(
                    height: 2,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  SizedBox(height: SizeConfig.calculateBlockVertical(30)),
                  Text(
                    "Настройки уведомлений",
                    textAlign: TextAlign.start,
                    style: AppThemeStyle.listStyle,
                  ),
                  SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                  Divider(
                    height: 2,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  SizedBox(height: SizeConfig.calculateBlockVertical(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Новый комментарий",
                        textAlign: TextAlign.start,
                        style: AppThemeStyle.subtitleList,
                      ),
                      SizedBox(width: 20),
                      CupertinoSwitch(
                          value: true,
                          onChanged: (newValue){

                          }
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ответ на комментарий",
                        textAlign: TextAlign.start,
                        style: AppThemeStyle.subtitleList,
                      ),
                      SizedBox(width: 20,),

                      CupertinoSwitch(
                          value: true,
                          onChanged: (newValue){

                          }
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Разрешить уведомления",
                        textAlign: TextAlign.start,
                        style: AppThemeStyle.subtitleList,
                      ),
                      SizedBox(width: 20,),
                      CupertinoSwitch(
                          value: false,
                          onChanged: (newValue){

                          }
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}