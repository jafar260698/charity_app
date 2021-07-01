
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/home/drawer_pages/change_username_vievmodel.dart';
import 'package:charity_app/view/theme/my_themes.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChangeUsernameScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangeUsernameModel>.reactive(
      builder:(context,model,child)=> Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(getTranslated(context,'change_username'), style: AppThemeStyle.appBarStyle17),
          leading: IconButton(
            iconSize: 18.0,
            splashRadius: 20,
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(
                controller: model.userController,
                decoration: InputDecoration(
                  hintText: getTranslated(context, 'username'),
                  prefixIcon: Icon(FlevaIcons.person_outline,color: primary),
                  enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: primary,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: primary,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(40)),
              BtnUI(
                height: 55,
                isLoading: false,
                textColor: Colors.white,
                color: AppThemeStyle.primaryColor,
                text: getTranslated(context, 'save'),
                ontap: () {

                },
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: ()=>ChangeUsernameModel(),
    );
  }

}