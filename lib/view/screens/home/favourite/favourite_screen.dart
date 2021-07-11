
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/formatters.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/article/article_detail.dart';
import 'package:charity_app/view/screens/home/favourite/favourite_detail_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'favourite_viewmodel.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Category> category;

  const FavouriteScreen({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavouriteViewModel>.reactive(
      builder: (context, model, child) =>  ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: Colors.white,
        dismissible: false,
        progressIndicator: CupertinoActivityIndicator(),
        child: Scaffold(
          backgroundColor: AppColor.primary,
          body: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.calculateBlockVertical(60)),
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
                      padding: EdgeInsets.only(left: 10,right: 10),
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
         model.getFavourite();
      },
      viewModelBuilder: () => FavouriteViewModel(),
    );
  }

  Widget getMainUI(FavouriteViewModel model,BuildContext context){
    if(model.isLoading){
      return Container();
    }
    if(model.article.data!=null&&model.article.data.length>0)
      return ListView.builder(
          itemCount: model.article.data.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder:(context,i){
            var data=model.article.data[i];
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteDetailScreen(folder: data.id,)));
              },
              child: Card(
                elevation: 0,
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
                        color: Color.fromRGBO(254, 205, 131,1)
                      ),
                      child: Icon(Icons.folder,color: Colors.white),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${getTranslated(context,'folder')}"+data.name,
                              style: AppThemeStyle.titleStyle,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: SizeConfig.calculateBlockVertical(15)),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text("${data.createdAt.substring(0,10)}",
                                style: AppThemeStyle.titleFormStyle,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      );
    else return Container(child: EmptyData());
  }
}