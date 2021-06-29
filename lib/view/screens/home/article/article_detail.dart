
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/article/article.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/formatters.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/home/article/article_detail_viemodel.dart';
import 'package:charity_app/view/screens/home/forum/forum_add_screen.dart';
import 'package:charity_app/view/screens/home/forum/forume_detail_viewmodel.dart';
import 'package:charity_app/view/screens/home/resource/resource_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Data article;

  const ArticleDetailScreen({Key key,this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticleDetailViewModel>.reactive(
      builder: (context, model, child) => ModalProgressHUD(
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
                  getTranslated(context,'article'),
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
                      child: mainUI(model,context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onModelReady: (model){

      },
      viewModelBuilder: () => ArticleDetailViewModel(),
    );
  }

  Widget mainUI(ArticleDetailViewModel viewModel,BuildContext context ){
    if(viewModel.isLoading){
      return Container();
    }else{
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text('Детский церебральный паралич',style: AppThemeStyle.headline1),
              SizedBox(height: SizeConfig.calculateBlockVertical(20)),
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
                              Text('3',style: AppThemeStyle.title12,)
                            ]
                        ),
                        SizedBox(width: 30),
                        Row(
                            children: <Widget>[
                              Icon(Ionicons.heart_outline,size: 18),
                              SizedBox(width: 4),
                              Text('4',style: AppThemeStyle.title12,)
                            ]
                        ),
                      ],
                    ),
                    Row(
                        children: <Widget>[
                          Icon(Ionicons.time_outline,size: 18),
                          SizedBox(width: 4),
                          Text("${dateFormatter2(DateTime.fromMillisecondsSinceEpoch(123122 * 1000))}", style: AppThemeStyle.title12,),
                        ]
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(15)),
              Container(
                height: SizeConfig.calculateBlockVertical(200),
                width: MediaQuery.of(context).size.width*1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/home_image2.png'),
                    ),
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(28)
                ),
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(15)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarImage(imageUrl: '',size:50.0),
                  SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'data.user.name',
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.subtitleList2,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                        Text(
                          'data.title',
                          style: AppThemeStyle.titleListPrimary,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(15)),
              Text('Детский церебральный паралич (ДЦП) – группа заболеваний головного мозга, возникающих вследствие его недоразвития или повреждения в процессе беременности или родов, и проявляющихся двигательными расстройствами, нарушениями речи и психики.',style: AppThemeStyle.subtitleList2),
              SizedBox(height: SizeConfig.calculateBlockVertical(10)),
              Text('Причины',style: AppThemeStyle.boldTitle,textAlign: TextAlign.start),
              SizedBox(height: SizeConfig.calculateBlockVertical(5)),
              Text('Преждевременные роды; осложнения во время родов; тугое обвитие пуповиной.',style: AppThemeStyle.subtitleList,textAlign: TextAlign.start),
            ],
          ),
        ),
      );
    }
  }
}