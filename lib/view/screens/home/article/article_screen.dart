import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/formatters.dart';
import 'package:charity_app/view/screens/home/article/article_detail.dart';
import 'package:charity_app/view/screens/home/article/article_screen_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ArticleScreen extends StatelessWidget {
  final List<Category> category;

  const ArticleScreen({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticleViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: appBarPage(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context, 'article'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.calculateBlockVertical(70.0)), // here the desired height
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
                    tabs: List<Widget>.generate(category.length, (int index) {
                      var item = category[index];
                      return new Tab(text: item.name);
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
                        color: AppColor.primary),
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(category.length, (int index) {
              return getSecondMainUI(context,model);
              // if(index!=1){
              //   return getMainUI(context);
              // } else return getSecondMainUI(context,model);
            }),
          ),
        ),
      ),
      onModelReady: (model){
        model.getAllArticle('razvitie');
      },
      viewModelBuilder: () => ArticleViewModel(),
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
      automaticallyImplyLeading: false,
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
          SizedBox(height: SizeConfig.calculateBlockVertical(30)),
          Text(
            appBarIncome,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(20)),
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
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailScreen()));
                      },
                      child: Card(
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
                                      style: AppThemeStyle.appBarStyle16,
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
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(10)),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getSecondMainUI(context,ArticleViewModel viewmodel){
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
      ),
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: getListUI(context, viewmodel),
        ),
      ),
    );
  }

  Widget getListUI(BuildContext context,ArticleViewModel model){
    if(model.isLoading){
      return CupertinoActivityIndicator();
    }
    if(model.article.data!=null&&model.article.data.length>0)
      return ListView.builder(
        itemCount: model.article.data.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder:(context,i){
          var data=model.article.data[i];
          return Container(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailScreen(article: data)));
                  },
                  child: Card(
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
                        SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: AppThemeStyle.resendCodeStyle,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                              Text(
                                data.description,
                                style: AppThemeStyle.titleFormStyle,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Row(
                              children: <Widget>[
                                Icon(FlevaIcons.eye_outline,size: 18),
                                SizedBox(width: 4),
                                Text('${data.views}',style: AppThemeStyle.title12,)
                              ]
                          ),
                          SizedBox(width: 30),
                          Row(
                              children: <Widget>[
                                Icon(Ionicons.heart_outline,size: 18),
                                SizedBox(width: 4),
                                Text('${data.likes}',style: AppThemeStyle.title12,)
                              ]
                          ),
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            Icon(Ionicons.time_outline,size: 18),
                            SizedBox(width: 4),
                            Text("${dateFormatter2(DateTime.fromMillisecondsSinceEpoch(data.createdAt * 1000))}", style: AppThemeStyle.title12,),
                          ]
                      )
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.calculateBlockVertical(10)),
              ],
            ),
          );
        }
    );
    else Text(getTranslated(context, 'data_not_found'),style: AppThemeStyle.appBarStyle16);
  }
}
