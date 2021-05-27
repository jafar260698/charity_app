
import 'package:charity_app/view/screens/auth/welcome_viewmodel.dart';
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
            body: Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SafeArea(
                        child: Column(
                          children: [
                            SizedBox(height: 70),
                            getWidgetLogoVertical,
                            SizedBox(height: 20),
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
                        SizedBox(height: 8),
                        Text("Результат прохождения анкеты"),
                        SizedBox(height: 8),
                        Text("Детский церебральный паралич (ДЦП) – группа заболеваний головного мозга, возникающих вследствие его недоразвития или повреждения в процессе беременности или родов, и проявляющихся двигательными расстройствами, нарушениями речи и психики."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: ()=>WelcomeViewModel(),
    );
  }
}
