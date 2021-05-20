/*
 * Created by Usmanov Eldor on 5/6/21, 10:58 AM
 *  Copyright (c) 6/5/2021
 *  Last modified 5/6/21, 10:49 AM
 *  2021 © SICNT. All rights reserved.
 */

import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/widgets/app_bar_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreen createState() => _CommentScreen();
}

class _CommentScreen extends State<CommentScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(108, 187, 217, 1),
      appBar: widgetAppBarTitle(context),
      body: Column(
        children: <Widget>[
          Text(
            'Комментарии',
            style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          SizedBox(height: 30,),
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://i.imgur.com/BoN9kdC.png")
                            )
                        )),
                    Card(
                      child: Text(
                        "Assalomu alekum",
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
