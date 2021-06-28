
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      return Container();
    }
  }
}