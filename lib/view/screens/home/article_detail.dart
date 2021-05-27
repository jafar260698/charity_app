
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArticleDetailScreen extends StatefulWidget {
  @override
  _ArticleDetailScreen createState() => _ArticleDetailScreen();
}

class _ArticleDetailScreen extends State<ArticleDetailScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(108, 187, 217, 1),
        appBar: appBarPage(
        context: context,
        appBarTitle: "",
        appBarIncome: "Статьи",
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              child: Container(
                color: Color.fromRGBO(244, 244, 244, 1),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BtnUI(
                          height: 45,
                          align: Alignment.centerLeft,
                          isLoading: false,
                          textColor: Colors.white,
                          color: Color.fromRGBO(98, 190, 184, 1),
                          text: 'Информаторий',
                          ontap: () { },
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:40.0),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Бибигуль Ахметова",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleListGrey,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Детский церебральный паралич",
                                      style: AppThemeStyle.text14_600,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Детский церебральный паралич Каждый год от хронического вирусного гепатита В, по оценкам ВОЗ, умирает почти 900 000 ",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleFormStyle,

                                    ),
                                    SizedBox(height:10),
                                    Text(
                                      "77 тем   Посл. cообщ. 20.02.2021 ",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleListGrey,
                                    ),
                                    Divider(thickness: 1,color: Colors.black54,),
                                    SizedBox(height:5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:40.0),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Бибигуль Ахметова",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleListGrey,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Детский церебральный паралич",
                                      style: AppThemeStyle.text14_600,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Детский церебральный паралич Каждый год от хронического вирусного гепатита В, по оценкам ВОЗ, умирает почти 900 000 ",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleFormStyle,
                                    ),
                                    SizedBox(height:10),
                                    Text(
                                      "77 тем   Посл. cообщ. 20.02.2021 ",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleListGrey,
                                    ),
                                    Divider(thickness: 1,color: Colors.black54,),
                                    SizedBox(height:5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:40.0),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Бибигуль Ахметова",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleListGrey,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Детский церебральный паралич",
                                      style: AppThemeStyle.text14_600,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Детский церебральный паралич Каждый год от хронического вирусного гепатита В, по оценкам ВОЗ, умирает почти 900 000 ",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleFormStyle,
                                    ),
                                    SizedBox(height:10),
                                    Text(
                                      "77 тем   Посл. cообщ. 20.02.2021 ",
                                      textAlign: TextAlign.start,
                                      style: AppThemeStyle.titleListGrey,
                                    ),
                                    Divider(thickness: 1,color: Colors.black54,),
                                    SizedBox(height:5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        color: Colors.black45,
        activeColor: Color.fromRGBO(108, 187, 217, 1),
        backgroundColor: Colors.white,
        items: [
          TabItem(icon: SvgPicture.asset('assets/svg/sending.svg')
          ),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => {

        },
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
      elevation: 0,
      backgroundColor: Color.fromRGBO(108, 187, 217, 1),
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
          SizedBox(height: 30.0),
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


}