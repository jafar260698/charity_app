
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/formatters.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/article/article_detail.dart';
import 'package:charity_app/view/screens/home/favourite/favourite_detail_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';


class FavouriteDetailScreen extends StatelessWidget {
  final int folder;

  const FavouriteDetailScreen({Key key, this.folder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavouriteDetailViewModel>.reactive(
      builder: (context, model, child) =>  ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: Colors.white,
        dismissible: false,
        progressIndicator: CupertinoActivityIndicator(),
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: widgetAppBarTitle(context),
          body: Column(
            children: <Widget>[
              Text(
                  getTranslated(context,'favourite'),
                  style: AppThemeStyle.headerWhite
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(30)),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    color: AppColor.greyDisabled,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: getMainUI(model,context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onModelReady: (model){
        model.getFavourite(folder.toString());
      },
      viewModelBuilder: () => FavouriteDetailViewModel(),
    );
  }

  Widget getMainUI(FavouriteDetailViewModel model,BuildContext context){
    if(model.isLoading){
      return Container();
    }
    if(model.article!=null)
      return ListView.builder(
          itemCount: model.article.data.length,
          shrinkWrap: true,
          itemBuilder: (context,i){
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
            );          }
      );
    else return Container(child: EmptyData());
  }
}