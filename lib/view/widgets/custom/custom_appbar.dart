
import 'package:charity_app/model/category.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


AppBar customAppbar({
  BuildContext context,
  String appBarTitle,
  String appBarIncome,
  List<Category> category,
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
  );
}