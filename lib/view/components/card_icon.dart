

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class  CardIcon extends StatefulWidget{
  final String operation;
  final String selectedIcon;

  CardIcon(this.operation,this.selectedIcon);

  @override
  _CardIcon createState()=>_CardIcon();
}

class _CardIcon extends State<CardIcon>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 16),
          width: 140,
          height: 120,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 6,
                offset: Offset(8.0,8.0),
              )
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: SvgPicture.asset('assets/svg/Icon_notification_outline.svg',height: 24,width: 24),
        ),
        SizedBox(height: 30),

      ],

    );
  }


}