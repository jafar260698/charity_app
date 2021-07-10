
import 'package:charity_app/model/questionnaire.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/questionnaire/main/questionnaire_viewmodel.dart';
import 'package:charity_app/view/screens/home/questionnaire/questionnaire_answer_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class QuestionnaireScreen extends StatelessWidget {
  final Data data;

  const QuestionnaireScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuestionnaireViewModel>.reactive(
      builder:(context,model,child)=> Material(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/login_background.png"),
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
                  SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                  Text(
                    "${data.title} \n\n ${data.age} года",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.calculateTextSize(24),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.calculateBlockVertical(100)),
                  getListUI(context, model),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => QuestionnaireViewModel(),
    );
  }

  getListUI(context,QuestionnaireViewModel model) {
      if(data.questions!=null&&data.questions.length>0) {
        return Expanded(
          child: ListView.builder(
              itemCount: data.questions.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,i) {
                var ss=data.questions[i];
                return Column(
                  children: [
                    Text(
                      ss,
                      textAlign: TextAlign.start,
                      style: AppThemeStyle.subtitleList,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget> [
                        Transform.scale(
                          scale: 1.5,
                          child: new Radio(
                            activeColor: AppColor.primary,
                            value: 2,
                            onChanged: (int value) { },
                            groupValue: null,
                          ),
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                        Transform.scale(
                        scale: 1.5,
                        child: new Radio(
                          value: 1,
                          activeColor: AppColor.primary,
                          onChanged: (int value) { },
                          groupValue: null,
                        ),
                      ),
                        ],
                    ),
                  ],
                );
              }),
        );
      } else return Container(child: EmptyData());
  }

}
