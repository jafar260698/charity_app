
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/auth/welcome_viewmodel.dart';
import 'package:charity_app/view/screens/home/questionnaire/questionnaire_answer_screen.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class QuestionnaireScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      builder:(context,model,child)=> Material(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/main_back.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: widgetAppBarTitle(context),
            body: Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionnaireAnswerScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Align(
                          alignment: Alignment.center,
                          child: getWidgetLogoHorizontal),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Эмоционально-волевое \nповедение \n\n 1-3 года",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(24),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 100),
                  Text(
                    "Если вы указываете пальцем на что-то в другом конце комнаты, ваш ребенок наэто смотрит?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(18 ),
                      fontWeight: FontWeight.bold,
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
