
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreen createState() => _FavouriteScreen();
}

class _FavouriteScreen extends State<FavouriteScreen> {

  @override
  Widget build(BuildContext context) {
    List<String> year = [
      'Болезни',
      'ДЦП',
      'Развитие',
      'Истории',
    ];
    return DefaultTabController(
      length: year.length,
      child: Scaffold(
        appBar: appBarPage(
          context: context,
          appBarTitle: "",
          appBarIncome: getTranslated(context, 'favourite'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80.0), // here the desired height
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: TabBar(
                  tabs: List<Widget>.generate(year.length, (int index) {
                    var item = year[index];
                    return new Tab(text: item);
                  }),
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(left: 30.0, right: 30.0,top: 3,bottom: 3),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.4),
                  labelStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat'),
                  indicator: MaterialIndicator(
                      height: 4,
                      topLeftRadius: 4,
                      topRightRadius: 4,
                      bottomLeftRadius: 0,
                      bottomRightRadius: 0,
                      tabPosition: TabPosition.bottom,
                      color: AppColor.primary
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: List<Widget>.generate(year.length, (int index) {
            return getMainUI(context);
          }),
        ),
      ),
    );
  }

  AppBar appBarPage({
    BuildContext context,
    String appBarTitle,
    String appBarIncome,
    PreferredSizeWidget bottom,
  }) {
    return AppBar(
      shadowColor: Colors.black45,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Opacity(
            opacity: 0.5,
            child: Text(
              appBarTitle,
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height:30.0),
          Text(
            appBarIncome,
              style: AppThemeStyle.headerPrimaryColor
          ),
          SizedBox(height: 20),
        ],
      ),
      bottom: bottom,
    );
  }

  getMainUI(context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
      ),
      child: Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
          child: Container(
            color: Color.fromRGBO(244, 244, 244, 1),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/image/beauty.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Детский церебральный ",
                                  style: AppThemeStyle.resendCodeStyle,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Причины, симптомы\nпрофилактика ",
                                  style: AppThemeStyle.titleFormStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/image/beauty.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Детский церебральный ",
                                  style: AppThemeStyle.resendCodeStyle,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Причины, симптомы\nпрофилактика ",
                                  style: AppThemeStyle.titleFormStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/image/beauty.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Детский церебральный ",
                                  style: AppThemeStyle.resendCodeStyle,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Причины, симптомы\nпрофилактика ",
                                  style: AppThemeStyle.titleFormStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/image/beauty.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Детский церебральный ",
                                  style: AppThemeStyle.resendCodeStyle,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Причины, симптомы\nпрофилактика ",
                                  style: AppThemeStyle.titleFormStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/image/beauty.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Детский церебральный ",
                                  style: AppThemeStyle.resendCodeStyle,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Причины, симптомы\nпрофилактика ",
                                  style: AppThemeStyle.titleFormStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/image/beauty.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Детский церебральный ",
                                  style: AppThemeStyle.resendCodeStyle,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Причины, симптомы\nпрофилактика ",
                                  style: AppThemeStyle.titleFormStyle,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}