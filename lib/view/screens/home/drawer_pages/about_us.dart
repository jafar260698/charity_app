import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUseScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppThemeStyle.primaryColor,
      appBar: widgetAppBarTitle(context),
      body: Column(
        children: <Widget>[
          Text(
            getTranslated(context, 'about_us'),
            style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(30)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)),
              child: Container(
                color: Color.fromRGBO(244, 244, 244, 1),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "About Ozim Platform",style: AppThemeStyle.appBarStyle16,
                  ),
                ),
              ),
            ),
          ),
          //  mainUI(model),
        ],
      ),
    );
  }

}
