import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class  CardIcon extends StatefulWidget{
  final String operation;
  final String iconPath;

  CardIcon(this.operation,this.iconPath);

  @override
  _CardIcon createState()=>_CardIcon();
}

class _CardIcon extends State<CardIcon>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){

          },
          child: Container(
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
            child: Padding(
                padding: EdgeInsets.all(12),
                child: SvgPicture.asset(widget.iconPath)),
          ),
        ),
        SizedBox(height: SizeConfig.calculateBlockVertical(10)),
        Text(
          widget.operation,
          textAlign: TextAlign.center,
          style: AppThemeStyle.titleFormStyle,
        )
      ],
    );
  }


}