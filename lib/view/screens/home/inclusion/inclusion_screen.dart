
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/screens/home/inclusion/inclusion_viewmodel.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class InclusionScreen extends StatelessWidget {
  final List<Category> category;

  InclusionScreen({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InclusionViewModel>.reactive(
      builder: (context, model, child) =>  DefaultTabController(
        length: category.length,
        child: Scaffold(
          appBar: appBarPage(
            context: context,
            appBarTitle: "",
            appBarIncome: getTranslated(context,'inclusion'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.calculateBlockVertical(80.0)), // here the desired height
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: TabBar(
                    tabs: List<Widget>.generate(category.length, (int index) {
                      var item = category[index].name;
                      return new Tab(text: item);
                    }),
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 3, bottom: 3),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white.withOpacity(0.4),
                    labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                    indicator: MaterialIndicator(
                      height: 4,
                      topLeftRadius: 4,
                      topRightRadius: 4,
                      bottomLeftRadius: 0,
                      bottomRightRadius: 0,
                      tabPosition: TabPosition.bottom,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: List<Widget>.generate(category.length, (int index) {
              return getMainUI(context,model);
            }),
          ),
        ),
      ),
      onModelReady: (model){
        model.getInclusion();
      },
      viewModelBuilder: () => InclusionViewModel(),
    );
  }

  AppBar appBarPage({
    BuildContext context,
    String appBarTitle,
    String appBarIncome,
    PreferredSizeWidget bottom,
  }) {
    return AppBar(
      elevation: 1.0,
      shadowColor: Colors.black45,
      centerTitle: true,
      title: Column(
        children: [
          Opacity(
            opacity: 0.5,
            child: Text(
              appBarTitle,
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(20.0)),
          Text(
            appBarIncome,
            style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(20),
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(10.0)),
        ],
      ),
      leading: CupertinoButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios, size: 20),
      ),
      bottom: bottom,
    );
  }

  Widget getMainUI(BuildContext context,InclusionViewModel model){
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
      ),
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: getListUI(context, model),
        ),
      ),
    );
  }

  getListUI(context,InclusionViewModel model) {
    if(model.isLoading){
      return CupertinoActivityIndicator();
    } else{
      return ListView.builder(
          itemCount: model.skillProvider.pages,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,i) {
            var data=model.skillProvider.data[i];
            return Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: AppThemeStyle.appBarStyle16,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                          Text(
                            data.description,
                            style: AppThemeStyle.titleStyle,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }
}
