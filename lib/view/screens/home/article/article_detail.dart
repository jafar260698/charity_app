
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ArticleDetailScreen extends StatefulWidget {
  @override
  _ArticleDetailScreen createState() => _ArticleDetailScreen();
}

class _ArticleDetailScreen extends State<ArticleDetailScreen> {

  @override
  Widget build(BuildContext context) {
    List<String> year = [
      'Болезни',
      'Фонды',
      'Развитие',
      'Истории',
    ];
    return DefaultTabController(
      length: year.length,
      child: Scaffold(
        appBar: appBarPage(
          context: context,
          appBarTitle: "",
          appBarIncome: getTranslated(context,'article'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0), // here the desired height
            child: Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(98, 190, 184, 1),
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
                  labelPadding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 3, bottom: 3),
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
                      color: Color.fromRGBO(98, 190, 184, 1)),
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
      elevation: 1.0,
      shadowColor: Colors.black45,
      centerTitle: true,
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
          SizedBox(height: 20.0),
          Text(
            appBarIncome,
            style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(20),
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
      leading: CupertinoButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios, size: 20),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.menu_outlined),
        )
      ],
      bottom: bottom,
    );
  }

  getMainUI(context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(98, 190, 184, 1),
      ),
      child: Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          child: Container(
            color: Color.fromRGBO(244, 244, 244, 1),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Благотворительный фонд «ДАРА»",
                                    style: AppThemeStyle.resendCodeStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(
                                thickness: 1,
                                color: Color.fromRGBO(98, 190, 184, 1)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.location_on,
                                    size: 24,
                                    color: Color.fromRGBO(98, 190, 184, 1)),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    "Г. Нур-Султан \n ул. А.Бокейхана, 1, «Назарбаев Центр»",
                                    style: AppThemeStyle.titleListPrimary,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
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