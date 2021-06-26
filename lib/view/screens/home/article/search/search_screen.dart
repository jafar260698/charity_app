
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/search_field_ui.dart';
import 'package:charity_app/view/screens/home/article/search/search_viewmodel.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController search = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: widgetAppBarTitle(context),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: SearchFieldUI(
                    controller: search,
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
              ],
            ),
          ),
        ),
      ),
      onModelReady: (model){

      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}