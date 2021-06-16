
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/auth/welcome_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/widgets/get_widget_family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/get_widget_logo.dart';

class WelcomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      builder:(context,model,child)=> MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/main_back.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SafeArea(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.calculateBlockVertical(70)),
                          getWidgetLogoVertical,
                          SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                          Padding(
                              padding: EdgeInsets.only(left: 35, right: 35),
                              child: getWidgetLogo)
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: SizeConfig.calculateBlockVertical(20),
                  left: SizeConfig.calculateBlockVertical(20),
                  right: SizeConfig.calculateBlockVertical(20),
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      BtnUI(
                        height: 55,
                        isLoading: false,
                        textColor: Colors.white,
                        color: AppColor.primary,
                        text: getTranslated(context, 'kz_language'),
                        ontap: () {
                          model.changeLanguage(context, 0);
                        },
                      ),
                      SizedBox(height: 8),
                      BtnUI(
                        height:55,
                        isLoading: false,
                        textColor: Colors.white,
                        color: AppColor.primary,
                        text: getTranslated(context, 'ru_language'),
                        ontap: () {
                          model.changeLanguage(context, 1);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: ()=>WelcomeViewModel(),
    );
  }
}
