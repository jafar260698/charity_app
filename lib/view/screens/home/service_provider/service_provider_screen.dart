import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/view/components/custom/custom_card.dart';
import 'package:charity_app/view/components/custom/custom_container.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/service_provider/service_provider_viewmodel.dart';
import 'package:charity_app/view/widgets/custom/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ServiceProviderScreen extends StatelessWidget {
  final List<Category> category;

  ServiceProviderScreen({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceProviderViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: customAppbar(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context,'service_provider'),
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
        model.getServiceProvider();
      },
      viewModelBuilder: () => ServiceProviderViewModel(),
    );
  }


  Widget getMainUI(BuildContext context,ServiceProviderViewModel model){
    return CustomContainer(child: getListUI(context, model));
  }

  getListUI(context,ServiceProviderViewModel model) {
    if(model.isLoading){
      return CupertinoActivityIndicator();
    } else{
      if(model.links?.data!=null&&model.links.data.length>0)
      return ListView.builder(
          itemCount: model.links.pages,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,i) {
            var data=model.links.data[i];
            return CustomCardContainer(
              title: data.title,
              description: data.description,
            );
          });
      else return Container(child: EmptyData());
    }
  }
}
