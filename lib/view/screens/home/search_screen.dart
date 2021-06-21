
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/search_field_ui.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  TextEditingController pinfl = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBarTitle(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: SearchFieldUI(
                  controller: pinfl,
                  text: '',
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.done,
                  hintText: getTranslated(context,'search'),
                  suffixIcon: IconButton(
                    splashRadius: 25,
                    onPressed: () {

                    },
                    icon: Icon(FlevaIcons.search),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated(context,'region'),style: AppThemeStyle.titleStyle,),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(8)),
              Divider(height: 2),
              SizedBox(height: SizeConfig.calculateBlockVertical(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${getTranslated(context,'year_old')}  3-6 месяцев",style: AppThemeStyle.titleStyle),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(8)),
              Divider(height: 2),
              SizedBox(height: SizeConfig.calculateBlockVertical(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated(context,'organization'),style: AppThemeStyle.titleStyle),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(8)),
              Divider(height: 2),
              SizedBox(height: SizeConfig.calculateBlockVertical(12)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated(context,'service'),style: AppThemeStyle.titleStyle),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(8)),
              Divider(height: 2),
              SizedBox(height: SizeConfig.calculateBlockVertical(12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppbar(BuildContext context){
    return AppBar(
      title: Text(
        '',
        style: AppThemeStyle.appBarStyle,
      ),
      leading: IconButton(
        splashRadius: 20,
        icon: Icon(Icons.menu_outlined),
        onPressed: () => {

        },
      ),
      elevation: 0,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20),
            child: SvgPicture.asset('assets/svg/Icon_notification_outline.svg')
        )
      ],
    );
  }

}