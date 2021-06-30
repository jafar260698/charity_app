import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/image/search.png",
          height: 80,
          width: 93,
        ),
        SizedBox(
          height: SizeConfig.calculateBlockVertical(18),
        ),
        Text(
          getTranslated(context, 'data_not_found'),
          style: TextStyle(
              fontSize: SizeConfig.calculateTextSize(15),
              fontWeight: FontWeight.w500,
              color: Colors.grey),
        )
      ],
    );
  }
}
