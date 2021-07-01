

import 'package:charity_app/utils/device_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarComponent extends StatelessWidget{
  final BuildContext context;
  final String appBarTitle;
  final String appBarIncome;
  final PreferredSizeWidget bottom;

  const AppbarComponent({Key key, this.context, this.appBarTitle, this.appBarIncome, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}