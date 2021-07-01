
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/forum/forum_sub_category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/forum/forum_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';
import 'forum_detail.dart';

class ForumScreen extends StatelessWidget {
  final bool existArrow;

  const ForumScreen({Key key, this.existArrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumViewModel>.reactive(
      builder: (context, model, child) =>  ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: Colors.white,
        dismissible: false,
        progressIndicator: CupertinoActivityIndicator(),
        child: Scaffold(
          backgroundColor: AppColor.primary,
          appBar: existArrow ? widgetAppBarTitle(context):null,
          body: Column(
            children: <Widget>[
              SizedBox(height: existArrow ? SizeConfig.calculateBlockVertical(0):SizeConfig.calculateBlockVertical(60)),
              Text(
                getTranslated(context,'forum'),
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
        model.fetchAllData();
      },
      viewModelBuilder: () => ForumViewModel(),
    );
  }

  Widget getMainUI(ForumViewModel model,BuildContext context){
   if(model.isLoading){
     return Container();
   }
   print("${model.forumCategory}");
   if(model.forumSubCategory!=null&&model.forumCategory!=null && model.forumCategory.length>0&&model.forumSubCategory.length>0)
     return ListView.builder(
       itemCount: model.forumCategory.length,
       shrinkWrap: true,
       itemBuilder: (context,i){
         List<ForumSubCategory> list = [];
         list.addAll(model.forumSubCategory.where((element) => element.category==model.forumCategory[i].sysName));
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             BtnUI(
               height: SizeConfig.calculateBlockVertical(50),
               align: Alignment.centerLeft,
               isLoading: false,
               textColor: Colors.white,
               color: AppColor.primary,
               text: model.forumCategory[i].name,
               ontap: () {

               },
             ),
             SizedBox(height: SizeConfig.calculateBlockVertical(5.0)),
             ListView.builder(
               itemCount: list.length,
               shrinkWrap: true,
               physics: ClampingScrollPhysics(),
               itemBuilder:(context,i){
                 return Padding(
                   padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                   child: InkWell(
                     onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumDetailScreen(title: list[i].name, subcategory: list[i].sysName)));
                     },
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               list[i].name,
                               style: AppThemeStyle.appBarStyle16,
                               textAlign: TextAlign.start,
                             ),
                             Icon(Icons.arrow_forward_ios,size: 16,)
                           ],
                         ),
                         SizedBox(height: SizeConfig.calculateBlockVertical(5.0)),
                         Text(
                           "77 тем   Посл. cообщ. 20.02.2021 ",
                           textAlign: TextAlign.start,
                         ),
                         Divider(thickness: 1,color: Colors.black54,),
                         SizedBox(height:5),
                       ],
                     ),
                   ),
                 );
               },
             ),
           ],
         );
       }
   );
   else return Container(child: EmptyData());
  }
}