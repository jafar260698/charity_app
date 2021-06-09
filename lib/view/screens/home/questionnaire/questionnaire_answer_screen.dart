
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/auth/welcome_viewmodel.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/get_widget_family.dart';
import 'package:charity_app/view/widgets/get_widget_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class QuestionnaireAnswerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      builder:(context,model,child)=> MaterialApp(
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/main_back.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: widgetAppBarTitle(context),
            body: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SafeArea(
                      child: Column(
                        children: [
                          getWidgetLogoVertical,
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 35, right: 35),
                              child: getWidgetLogo)
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0,
                  child: Column(
                    children: [
                      Text("Результат прохождения анкеты",
                        style: TextStyle(
                        fontSize: SizeConfig.calculateTextSize(24),
                        fontWeight: FontWeight.bold,
                        color: AppThemeStyle.colorSuccess,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text("Детский церебральный паралич (ДЦП) – группа заболеваний головного мозга, возникающих вследствие его недоразвития или повреждения в процессе беременности или родов, и проявляющихся двигательными расстройствами, нарушениями речи и психики.",style: AppThemeStyle.title14,),
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
