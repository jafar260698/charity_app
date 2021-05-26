import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          margin: EdgeInsets.only(right: 10,left: 10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              // BoxShadow(
              //   color: Colors.grey,
              //   blurRadius: 1,
              //   spreadRadius: 3,
              // )
            ],
            borderRadius: BorderRadius.circular(25),
          ),
          child: SvgPicture.asset('assets/svg/Icon_notification_outline.svg',height: 20,width: 20),
        ),
        SizedBox(height: 10),
        Text(
          widget.operation,
          textAlign: TextAlign.center,
        )
      ],

    );
  }


}