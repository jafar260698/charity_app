
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/home/forum/forum_add_viewmodel.dart';
import 'package:charity_app/view/screens/home/forum/forume_detail_viewmodel.dart';
import 'package:charity_app/view/screens/home/resource/resource_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForumAddScreen extends StatelessWidget {
  final String subCategory;

  const ForumAddScreen({Key key, this.subCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumAddViewModel>.reactive(
      builder: (context, model, child) => Material(
         child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/register_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: widgetAppBarTitle(context),
            body: Padding(
              padding: EdgeInsets.only(left: 25,right: 25),
              child: Container(
                child: Stack(
                  children:<Widget> [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                        Text(
                          getTranslated(context, 'add_forum'),
                          style: TextStyle(
                              fontSize: 24.0,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(15)),
                        TextField(
                          controller: model.titleController,
                          maxLines: 2,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: getTranslated(context, 'title'),
                            hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                            enabledBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                        TextField(
                          controller: model.noteController,
                          style: TextStyle(color: Colors.white),
                          maxLines: 7,
                          decoration: InputDecoration(
                            hintText: getTranslated(context, 'description'),
                            hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                            enabledBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: new UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: SizeConfig.calculateBlockVertical(20),
                      left: SizeConfig.calculateBlockVertical(20),
                      right: SizeConfig.calculateBlockVertical(20),
                      child: Column(
                        children: [
                          BtnUI(
                            height: 55,
                            isLoading: model.isLoading,
                            textColor: Colors.white,
                            color: AppColor.primary,
                            text: getTranslated(context, 'create'),
                            ontap: () {
                              model.postForum(context,subCategory);
                            },
                          ),
                          SizedBox(height: SizeConfig.calculateBlockVertical(8)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ForumAddViewModel(),
    );
  }

}