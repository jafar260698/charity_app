
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/formatters.dart';
import 'package:charity_app/view/screens/home/article/article_detail.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'favourite_viewmodel.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Category> category;

  const FavouriteScreen({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavouriteViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: appBarPage(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context, 'favourite'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.calculateBlockVertical(80.0)), // here the desired height
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
              return getSecondMainUI(context,model,category[index].name);
            }),
          ),
        ),
      ),
      onModelReady: (model){
        model.getFavourite('razvitie');
      },
      viewModelBuilder: () => FavouriteViewModel(),
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

  getSecondMainUI(context,FavouriteViewModel model,String category){
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
          child: getListUI(context, model,category),
        ),
      ),
    );
  }

  Widget getListUI(BuildContext context,FavouriteViewModel model,String category){
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
                                image: data.authorPhoto==null?AssetImage('assets/image/article_image.png'):NetworkImage(data.authorPhoto),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                          Expanded(
                            child: Padding(
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
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(data.inBookmarks==false ? Icons.bookmark_outline:Icons.bookmark,color: AppColor.primary,))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: <Widget>[
                              Icon(FlevaIcons.eye_outline,size: 18),
                              SizedBox(width: 4),
                              Text('${data.views}',style: AppThemeStyle.title12,)
                            ]
                        ),
                        Row(
                            children: <Widget>[
                              Icon(Ionicons.heart_outline,size: 18),
                              SizedBox(width: 4),
                              Text('${data.likes}',style: AppThemeStyle.title12,)
                            ]
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