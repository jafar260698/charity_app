/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 4/28/21 10:01 AM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/21/21 2:18 PM
 *
 *
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomIconButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function onPressed;

  const CustomIconButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = ThemeProvider.controllerOf(context).theme.data;
    return Padding(
      padding: const EdgeInsets.only(bottom: 13.0),
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.black12,
        margin: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          color: theme.cardColor,
          padding: EdgeInsets.all(16.0),
          borderRadius: BorderRadius.circular(13.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: theme.primaryColor.withOpacity(0.1),
                child: icon,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: theme.accentIconTheme.color,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
