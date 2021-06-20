
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/card_icon.dart';
import 'package:charity_app/view/components/search_field_ui.dart';
import 'package:charity_app/view/screens/other/notification/notification_screen.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeWithoutDrawerScreen extends StatefulWidget {
  @override
  _HomeWithoutDrawerScreen createState() => _HomeWithoutDrawerScreen();
}

class _HomeWithoutDrawerScreen extends State<HomeWithoutDrawerScreen> {

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  TextEditingController pinfl = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.calculateBlockVertical(10)),
            Container(
              height: SizeConfig.calculateBlockVertical(200),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20,right: 10),
                  itemCount: imgList.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      height: SizeConfig.calculateBlockVertical(240),
                      width: MediaQuery.of(context).size.width*0.85,
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
              child: SearchFieldUI(
                controller: pinfl,
                text: '',
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.done,
                hintText: getTranslated(context,'search'),
                suffixIcon: IconButton(
                  splashRadius: 25,
                  onPressed: () {

                  },
                  icon: Icon(FlevaIcons.search),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CardIcon(getTranslated(context, 'violation'), "assets/svg/services/medicine.svg"),
                CardIcon(getTranslated(context,'skills'), "assets/svg/services/skill.svg"),
                CardIcon(getTranslated(context,'resource'), "assets/svg/services/resource.svg")
              ],
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CardIcon(getTranslated(context,'service_provider'), "assets/svg/services/service_provider.svg"),
                CardIcon(getTranslated(context,'rules'), "assets/svg/services/rules.svg"),
                CardIcon(getTranslated(context,'inclusion'), "assets/svg/services/inclusion.svg")
              ],
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CardIcon(getTranslated(context,'article'), "assets/svg/services/article.svg"),
                CardIcon(getTranslated(context,'forum'), "assets/svg/services/forum.svg"),
                CardIcon(getTranslated(context,'for_mother'), "assets/svg/services/for_mummy.svg")
              ],
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(80))
          ],
        ),
      ),
    );
  }

  Widget getAppBar(context) {
    return AppBar(
      elevation: 2.0,
      centerTitle: true,
      shadowColor: Colors.black26,
      automaticallyImplyLeading: false,
      title: Text(""),
      actions: <Widget>[
        IconButton(
          splashRadius: 20,
          iconSize: 30,
          padding: EdgeInsets.all(0.0),
          icon: SvgPicture.asset(
            'assets/svg/notifications.svg',
            color: ThemeProvider.themeOf(context).data.accentIconTheme.color,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
        ),
      ],
    );
  }

}