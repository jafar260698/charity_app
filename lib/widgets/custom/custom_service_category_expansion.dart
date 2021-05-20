/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 4/28/21 10:00 AM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/28/21 9:29 AM
 *
 *
 */

import 'package:charity_app/utils/device_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:theme_provider/theme_provider.dart';


class CabinetServiceButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function onPressed;

  const CabinetServiceButton(
      {Key key, this.title, this.onPressed, this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 8.0,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0),
              child: Theme(
                  data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          padding: EdgeInsets.all(11),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xAA15257E).withAlpha(80),
                                    offset: Offset(0, 20),
                                    blurRadius: 20)
                              ]),
                          // radius: 20,
                          // backgroundColor: theme.primaryColor,
                          child: SvgPicture.asset(iconPath,
                              height: 18.0, width: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(width: 8.0),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.calculateTextSize(16),
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
