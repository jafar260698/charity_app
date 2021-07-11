import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/view/components/custom/custom_card.dart';
import 'package:charity_app/view/components/custom/custom_container.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/skill/skill_viewmodel.dart';
import 'package:charity_app/view/widgets/custom/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SkillScreen extends StatelessWidget {
  final List<Category> category;

  SkillScreen({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SkillViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: customAppbar(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context,'skills'),
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
        model.getSkill();
      },
      viewModelBuilder: () => SkillViewModel(),
    );
  }


  Widget getMainUI(BuildContext context,SkillViewModel model){
    return CustomContainer(child: getListUI(context, model));
  }

  getListUI(context,SkillViewModel model) {
    if(model.isLoading){
      return CupertinoActivityIndicator();
    } else{
      if(model.skill?.data!=null&&model.skill.data.length>0)
      return ListView.builder(
          itemCount: model.skill.pages,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,i) {
            var data=model.skill.data[i];
            return CustomCardContainer(
              title: data.title,
              description: data.description,
            );
          });
      else return Container(child: EmptyData());
    }
  }
}
