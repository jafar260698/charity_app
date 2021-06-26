
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
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
        model.getForumCategory();
        model.getForumSubCategory();
      },
      viewModelBuilder: () => ForumViewModel(),
    );
  }

  Widget getMainUI(ForumViewModel model,BuildContext context){
   if(model.isLoading){
     return Container();
   }
   return SingleChildScrollView(
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
           text: 'Специальный форум',
           ontap: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumDetailScreen()));
           },
         ),
         SizedBox(height: 5),
         Padding(
           padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Информаторий",
                     style: AppThemeStyle.appBarStyle16,
                     textAlign: TextAlign.start,
                   ),
                   Icon(Icons.arrow_forward_ios,size: 16,)
                 ],
               ),
               SizedBox(height:5),
               Text(
                 "77 тем   Посл. cообщ. 20.02.2021 ",
                 textAlign: TextAlign.start,
               ),
               Divider(thickness: 1,color: Colors.black54,),
               SizedBox(height:5),
             ],
           ),
         ),
         Padding(
           padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Информаторий",
                     style: AppThemeStyle.titleStyle,
                     textAlign: TextAlign.start,
                   ),
                   Icon(Icons.arrow_forward_ios,size: 16,)
                 ],
               ),
               SizedBox(height:5),
               Text(
                 "77 тем   Посл. cообщ. 20.02.2021 ",
                 textAlign: TextAlign.start,
               ),
               Divider(thickness: 1,color: Colors.black54,),
               SizedBox(height:5),
             ],
           ),
         ),
       ],
     ),
   );
  }
}