
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/auth/welcome_viewmodel.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:charity_app/view/widgets/get_widget_family.dart';
import 'package:charity_app/view/widgets/get_widget_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class QuestionnaireScreen extends StatelessWidget {

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
                            SizedBox(height: 30),
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: getWidgetLogoHorizontal),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Эмоционально-волевое \nповедение \n 1-3 года",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.calculateTextSize(24),
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
