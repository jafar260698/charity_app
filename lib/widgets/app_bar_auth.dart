import 'package:charity_app/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';


widgetAppBarAuth(context, {String title = '', String lang = 'uz'}) {
  var theme = ThemeProvider.controllerOf(context).theme.data;
  return AppBar(
    title: Text(
      title,
      style: AppThemeStyle.appBarStyle,
    ),
    leading: IconButton(
      iconSize: 18.0,
      splashRadius: 20,
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.of(context).pop(),
    ),
    elevation: 0,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: CupertinoButton(
          onPressed: () {

          },
          padding: EdgeInsets.all(0.0),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                border: Border.all(color: Colors.grey)),
            child: Icon(
              Icons.language_outlined,
              color: theme.iconTheme.color,
            ),
          ),
        ),
      ),
    ],
  );
}


widgetAppBarAuthTitle(context) {
  return AppBar(
    title: Text(
      '',
      style: AppThemeStyle.appBarStyle,
    ),
      leading: IconButton(
      splashRadius: 20,
      icon: Icon(Icons.notifications_none),
      onPressed: () => Navigator.of(context).pop(),
    ),
    elevation: 0,
    actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.menu),
      )
    ],
  );
}

widgetAppBarTitle(
    context, {
      String title = '',
    }) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    title: Text(title, style: AppThemeStyle.appBarStyle),
    leading: IconButton(
      iconSize: 18.0,
      splashRadius: 20,
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}

