
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/custom/custom_card.dart';
import 'package:charity_app/view/components/custom/custom_container.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/inclusion/inclusion_viewmodel.dart';
import 'package:charity_app/view/screens/home/questionnaire/main/questionnaire_viewmodel.dart';
import 'package:charity_app/view/screens/home/questionnaire/questionnaire_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/custom/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class QuestionnaireCategoryScreen extends StatelessWidget {
  final List<Category> category;

  QuestionnaireCategoryScreen({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuestionnaireViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: customAppbar(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context,'questionnaire'),
            category: category,
          ),
          body: TabBarView(
            children: List<Widget>.generate(category.length, (int index) {
              return getMainUI(context,model);
            }),
          ),
        ),
      ),
      onModelReady: (model){
        model.getQuestionnaire();
      },
      viewModelBuilder: () => QuestionnaireViewModel(),
    );
  }


  Widget getMainUI(BuildContext context,QuestionnaireViewModel model){
    return CustomContainer(child: getListUI(context, model));
  }

  getListUI(context,QuestionnaireViewModel model) {
    if(model.isLoading){
      return CupertinoActivityIndicator();
    } else{
      if(model.questionnaire?.data!=null&&model.questionnaire.data.length>0)
        return ListView.builder(
            itemCount: model.questionnaire.pages,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,i) {
              var data=model.questionnaire.data[i];
              return CustomCardContainer(
                title: data.title,
                description: data.age,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionnaireScreen(data: data)));
                }
              );
            });
      else return Container(child: EmptyData());
    }
  }
}
