
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/formatters.dart';
import 'package:charity_app/view/components/btn_ui.dart';
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

class ForumDetailScreen extends StatelessWidget {
  final String title;
  final String subcategory;

  const ForumDetailScreen({Key key,this.title, this.subcategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumDetailViewModel>.reactive(
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
                      child: mainUI(model,context),
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
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumAddScreen(subCategory: subcategory))),
          },
          ),
        ),
      ),
      onModelReady: (model){
         model.getForumCategory(subcategory);
      },
      viewModelBuilder: () => ForumDetailViewModel(),
    );
  }

  Widget mainUI(ForumDetailViewModel viewModel,BuildContext context ){
    if(viewModel.isLoading){
      return Container();
    }else{
      if(viewModel.forumDetail.data.length>0)
        return ListView.builder(
          itemCount: viewModel.forumDetail.data.length,
          itemBuilder: (context,i){
             var data=viewModel.forumDetail.data[i];
             return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.calculateBlockHorizontal(15),
                        right: SizeConfig.calculateBlockHorizontal(15),
                        top: SizeConfig.calculateBlockVertical(10),
                        bottom: SizeConfig.calculateBlockVertical(5)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AvatarImage(imageUrl: data.user.avatar==null ? null : data.user.avatar,size:50.0),
                        SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                data.user.name,
                                textAlign: TextAlign.start,
                                style: AppThemeStyle.titleListPrimary,
                              ),
                              SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                              Text(
                                data.title,
                                style: AppThemeStyle.text14_600,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                              Text(
                                data.description,
                                textAlign: TextAlign.start,
                                style: AppThemeStyle.titleFormStyle,

                              ),
                              SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "${dateFormatter(DateTime.fromMillisecondsSinceEpoch(data.createdAt * 1000))}",
                                  textAlign: TextAlign.end,
                                  style: AppThemeStyle.titleListGrey,
                                ),
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
             );
        }
      );
      else Text(getTranslated(context, 'data_not_found'),style: AppThemeStyle.appBarStyle16);
    }
  }
}