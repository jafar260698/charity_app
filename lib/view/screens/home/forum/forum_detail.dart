
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/home/forum/forume_detail_viewmodel.dart';
import 'package:charity_app/view/screens/home/resource/resource_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForumDetailScreen extends StatelessWidget {
  final String subcategory;

  const ForumDetailScreen({Key key, this.subcategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumDetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColor.primary,
        appBar: widgetAppBarTitle(context),
        body: Column(
          children: <Widget>[
            Text(
                getTranslated(context,'forum'),
                style: AppThemeStyle.headerWhite
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(30)),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                child: Container(
                  color: AppColor.white,
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
                            color: AppColor.primary,
                            text: 'Информаторий',
                            ontap: () { },
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          Padding(
                            padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:40.0),
                                SizedBox(height: SizeConfig.calculateBlockHorizontal(10)),
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
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          Padding(
                            padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:40.0),
                                SizedBox(height: SizeConfig.calculateBlockHorizontal(10)),
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
                          SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                          Padding(
                            padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:40.0),
                                SizedBox(height: SizeConfig.calculateBlockHorizontal(10)),
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
          activeColor: AppColor.primary,
          backgroundColor: Colors.white,
          items: [
            TabItem(icon: Icon(Icons.add,size: 32,color: Colors.white)
            ),
          ],
          initialActiveIndex: 0,
          onTap: (int i) => {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResourceScreen())),
        },
        ),
      ),
      onModelReady: (model){
         model.getForumCategory(subcategory);
      },
      viewModelBuilder: () => ForumDetailViewModel(),
    );
  }

}