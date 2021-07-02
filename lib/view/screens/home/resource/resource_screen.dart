import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/custom/custom_container.dart';
import 'package:charity_app/view/components/no_data.dart';
import 'package:charity_app/view/screens/home/resource/resource_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/widgets/custom/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResourceScreen extends StatelessWidget {
  final List<Category> category;

  ResourceScreen({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResourceViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: customAppbar(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context,'resource'),
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
        model.getLinks('razvitie');
      },
      viewModelBuilder: () => ResourceViewModel(),
    );
  }


  Widget getMainUI(BuildContext context,ResourceViewModel model){
    return CustomContainer(child: getListUI(context, model));
  }

  getListUI(context,ResourceViewModel model) {
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
          return Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: ()=> model.launchURL(data.link.trim()),
                  child: Text(
                    data.link,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.sometimes,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                Text(
                  data.description,
                  textAlign: TextAlign.start,
                ),
                Divider(thickness: 1, color: Colors.black54),
                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
              ],
            ),
          );
        });
      else return Container(child: EmptyData());
    }
  }
}
