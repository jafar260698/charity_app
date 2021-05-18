/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 4/28/21 10:00 AM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/28/21 9:29 AM
 *
 *
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtonOpacity extends StatelessWidget {
  final Function onPressed;
  final Widget title;

  const CustomButtonOpacity({Key key, this.onPressed, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        child: CupertinoButton(
          padding: EdgeInsets.only(
            top: 13.0,
            bottom: 13.0,
            left: 20.0,
            right: 20.0,
          ),
          color: Color(0x22FFFFFF),
          borderRadius: BorderRadius.circular(13.0),
          onPressed: onPressed,
          child: title,
        ),
      ),
    );
  }
}
