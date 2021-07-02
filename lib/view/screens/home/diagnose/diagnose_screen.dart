import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/custom/custom_card.dart';
import 'package:charity_app/view/components/custom/custom_container.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/diagnose/diagnose_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/widgets/custom/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class DiagnoseScreen extends StatelessWidget {
  final List<Category> category;

  DiagnoseScreen({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DiagnosesViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: customAppbar(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context,'diagnose'),
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
        model.getDiagnoses();
      },
      viewModelBuilder: () => DiagnosesViewModel(),
    );
  }


  Widget getMainUI(BuildContext context,DiagnosesViewModel model){
    return CustomContainer(child: getListUI(context, model));
  }

  getListUI(context,DiagnosesViewModel model) {
    if(model.isLoading){
      return CupertinoActivityIndicator();
    } else{
      if(model.diagnoses?.data!=null&&model.diagnoses.data.length>0)
      return ListView.builder(
          itemCount: model.diagnoses.pages,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,i) {
            var data=model.diagnoses.data[i];
            return CustomCardContainer(
              title: data.name,
              description: data.description,
            );
          });
      else return Container(child: EmptyData());
    }
  }
}
