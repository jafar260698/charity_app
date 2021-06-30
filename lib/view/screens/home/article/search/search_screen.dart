
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/formatters.dart';
import 'package:charity_app/view/components/search_field_ui.dart';
import 'package:charity_app/view/screens/home/article/article_detail.dart';
import 'package:charity_app/view/screens/home/article/search/search_viewmodel.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController search = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('', style: AppThemeStyle.appBarStyle),
          leading: IconButton(
            iconSize: 18.0,
            splashRadius: 20,
            icon: Icon(Icons.arrow_back_ios,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: SearchFieldUI(
                    controller: search,
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
                SizedBox(height: SizeConfig.calculateBlockVertical(30)),
              ],
            ),
          ),
        ),
      ),
      onModelReady: (model){

      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }

  Widget mainUI(SearchViewModel viewModel){
    if(viewModel.isLoading)
      return Container();
    else{
      if(viewModel.article.data.length>0)
        return ListView.builder(
            itemCount: viewModel.article.data.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,i){
              var data=viewModel.article.data[i];
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
      else Text('Data not found',style: AppThemeStyle.appBarStyle16);
    }
  }

}