import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/home/questionnaire/questionnaire_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ResourceScreen extends StatefulWidget {
  @override
  _ResourceScreen createState() => _ResourceScreen();
}

class _ResourceScreen extends State<ResourceScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> year = [
      'Категория 1',
      'Категория 2',
      'Категория 3',
      'Категория 4',
    ];
    return DefaultTabController(
      length: year.length,
      child: Scaffold(
        appBar: appBarPage(
          context: context,
          appBarTitle: "",
          appBarIncome: getTranslated(context,'resource'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0), // here the desired height
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
                      color: AppColor.primary,
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
                    SizedBox(height: 5),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionnaireScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Ссылка N1",
                              style: AppThemeStyle.titleStyle,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height:5),
                            Text(
                              "Краткое описание что находится в данной ссылке",
                              textAlign: TextAlign.start,
                            ),
                            Divider(thickness: 1,color: Colors.black54,),
                            SizedBox(height:5),
                            Text(
                              "Ссылка N1",
                              style: AppThemeStyle.titleStyle,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height:5),
                            Text(
                              "Краткое описание что находится в данной ссылке",
                              textAlign: TextAlign.start,
                            ),
                            Divider(thickness: 1,color: Colors.black54,),
                            SizedBox(height:5),
                            Text(
                              "Ссылка N1",
                              style: AppThemeStyle.titleStyle,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height:5),
                            Text(
                              "Краткое описание что находится в данной ссылке",
                              textAlign: TextAlign.start,
                            ),
                            Divider(thickness: 1,color: Colors.black54,),
                            SizedBox(height:5),
                            Text(
                              "Ссылка N1",
                              style: AppThemeStyle.titleStyle,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height:5),
                            Text(
                              "Краткое описание что находится в данной ссылке",
                              textAlign: TextAlign.start,
                            ),
                            Divider(thickness: 1,color: Colors.black54,),
                            SizedBox(height:5),
                          ],
                        ),
                      ),
                    ),
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
