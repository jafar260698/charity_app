
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/home/menu/change_username_screen.dart';
import 'package:charity_app/view/screens/home/menu/settings_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/blurred_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder:(context,model,child)=> Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('', style: AppThemeStyle.appBarStyle),
          leading: IconButton(
            iconSize: 18.0,
            splashRadius: 20,
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 30),
                  InkWell(
                    onTap: (){
                      model.pickFile();
                    }, child: BlurredAvatar(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:70.0)),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeUsernameScreen()));
                    },
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.username,
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.listStyle,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                        Text(
                          getTranslated(context,'change_username'),
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.titleListPrimary,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(20)),
              SizedBox(height: SizeConfig.calculateBlockVertical(20)),
              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                    getTranslated(context, 'choose_language'),
                      textAlign: TextAlign.start,
                      style: AppThemeStyle.listStyle,
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                    Divider(
                      height: 2,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context,'kz_language'),
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.subtitleList,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                        Transform.scale(
                          scale: 1.5,
                          child: new Radio(
                            value: 1,
                            activeColor: AppColor.primary,
                            groupValue: model.radioValue,
                            onChanged: model.handleRadioValueChange,
                          ),
                        ),                    ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(getTranslated(context,'ru_language'),
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.subtitleList,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                        Transform.scale(
                          scale: 1.5,
                          child: new Radio(
                            activeColor: AppColor.primary,
                            value: 2,
                            groupValue: model.radioValue,
                            onChanged: model.handleRadioValueChange,
                          ),
                        ),                    ],
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(30)),
                    Text(
                      getTranslated(context,'settings_notification'),
                      textAlign: TextAlign.start,
                      style: AppThemeStyle.listStyle,
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                    Divider(
                      height: 2,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context,'new_comment'),
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.subtitleList,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                        CupertinoSwitch(
                            value: model.newComment,
                            activeColor: AppColor.primary,
                            onChanged: (newValue){
                              model.newCommentFunc(newValue);
                            }
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context,'reply_to_comment'),
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.subtitleList,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                        CupertinoSwitch(
                            value: model.replyComment,
                            activeColor: AppColor.primary,
                            onChanged: (newValue){
                              model.replyCommentFunc(newValue);
                            }
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context,'give_permission'),
                          textAlign: TextAlign.start,
                          style: AppThemeStyle.subtitleList,
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                        CupertinoSwitch(
                            value: model.permissionNotification,
                            activeColor: AppColor.primary,
                            onChanged: (newValue){
                              model.permissionNotificationFunc(newValue);
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onModelReady: (model) => {
        model.setContext(context)
      },
      viewModelBuilder: ()=>SettingsViewModel(),
    );
  }

}