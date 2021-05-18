/*
 * *
 *  * Created by Mahmud Nurmuhammedov on 4/28/21 10:00 AM
 *  * Copyright (c) 2021 . All rights reserved.
 *  * Last modified 4/22/21 12:37 PM
 *
 *
 */

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)
      ),
      child: child,
    );
  }
}
