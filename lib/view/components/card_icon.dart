import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class  CardIcon extends StatefulWidget{
  final String operation;
  final String iconPath;
  final GestureTapCallback onTap;

 const CardIcon({Key key,this.operation, this.iconPath, this.onTap});

  @override
  _CardIcon createState()=>_CardIcon();
}

class _CardIcon extends State<CardIcon>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 0,
            child: Container(
              width: 70,
              height: 70,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SvgPicture.asset(widget.iconPath)),
            ),
          ),
        ),
        SizedBox(height: SizeConfig.calculateBlockVertical(5)),
        Text(
          widget.operation,
          textAlign: TextAlign.center,
          style: AppThemeStyle.titleFormStyle,
        )
      ],
    );
  }


}