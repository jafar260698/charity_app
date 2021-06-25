

import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/bottom_modal_sheet.dart';
import 'package:charity_app/view/screens/auth/splash_screen.dart';
import 'package:charity_app/view/screens/home/diagnose/diagnose_screen.dart';
import 'package:charity_app/view/screens/home/inclusion/inclusion_screen.dart';
import 'package:charity_app/view/screens/home/menu/faq_screen.dart';
import 'package:charity_app/view/screens/home/menu/favourite_menu_screen.dart';
import 'package:charity_app/view/screens/home/menu/settings_screen.dart';
import 'package:charity_app/view/screens/home/resource/resource_screen.dart';
import 'package:charity_app/view/screens/home/rights/rights_screen.dart';
import 'package:charity_app/view/screens/home/service_provider/service_provider_screen.dart';
import 'package:charity_app/view/screens/home/skill/skill_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:charity_app/view/widgets/exit_modal_view.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'drawer_viewmodel.dart';

class CabinetDrawer extends StatelessWidget {
  const CabinetDrawer(
      {Key key,
      this.screenIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColor.primary,
              body: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: SizeConfig.calculateBlockVertical(50)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: SizeConfig.calculateBlockHorizontal(30)),
                                AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:70.0),
                                SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                                Expanded(
                                  child: Text(
                                    "Бибигуль\n Ахметова",
                                    textAlign: TextAlign.start,
                                    style: AppThemeStyle.listStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: SizeConfig.calculateBlockVertical(30)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                top: SizeConfig.calculateBlockVertical(20),
                                bottom: SizeConfig.calculateBlockVertical(30)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FaqScreen()));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(10),
                                        bottom: SizeConfig.calculateBlockVertical(10),
                                        left: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/svg/info_icon.svg',color: Colors.white),
                                        SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                                        Text(getTranslated(context,'about_us'),style: AppThemeStyle.buttonWhite16),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                                Divider(
                                  height: 2,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(10),
                                        bottom: SizeConfig.calculateBlockVertical(10),
                                        left: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/svg/home_icon.svg',color: Colors.white),
                                        SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                                        Text(getTranslated(context,'home'),style: AppThemeStyle.buttonWhite16),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 35,
                                      top: SizeConfig.calculateBlockVertical(10),
                                      bottom: SizeConfig.calculateBlockVertical(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DiagnoseScreen(category: model.category)));
                                          },
                                          child: Text(getTranslated(context,'diagnose'),style: AppThemeStyle.buttonWhite16)),
                                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkillScreen(category: model.category)));
                                          },
                                          child: Text(getTranslated(context,'skills'),style: AppThemeStyle.buttonWhite16)),
                                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      InkWell( onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResourceScreen(category: model.category)));
                                      },
                                          child: Text(getTranslated(context,'resource'),style: AppThemeStyle.buttonWhite16)),
                                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceProviderScreen(category: model.category)));
                                          },
                                          child: Text(getTranslated(context,'service_provider'),style: AppThemeStyle.buttonWhite16)),
                                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RightScreen(category: model.category)));
                                          },
                                          child: Text(getTranslated(context,'rules'),style: AppThemeStyle.buttonWhite16)),
                                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => InclusionScreen(category: model.category)));
                                          },
                                          child: Text(getTranslated(context,'inclusion'),style: AppThemeStyle.buttonWhite16)),
                                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      InkWell(
                                          onTap: (){

                                          },
                                          child: Text(getTranslated(context,'article'),style: AppThemeStyle.buttonWhite16)),
                                      SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      InkWell(
                                          onTap: (){},
                                          child: Text(getTranslated(context,'forum'),style: AppThemeStyle.buttonWhite16)),
                                      // SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                                      // InkWell( onTap: (){ },child: Text(getTranslated(context,'link'),style: AppThemeStyle.buttonWhite16)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(12)),
                                Divider(
                                  height: 2,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteMenuScreen()));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(10),
                                        bottom: SizeConfig.calculateBlockVertical(10),
                                        left: 10),
                                    child: Row(
                                      children: [
                                        Icon(FlevaIcons.bookmark_outline,color: Colors.white),
                                        SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                                        Text(getTranslated(context,'favourite'),style: AppThemeStyle.buttonWhite16,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FaqScreen()));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(10),
                                        bottom: SizeConfig.calculateBlockVertical(10),
                                        left: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/svg/question_icon.svg',color: Colors.white),
                                        SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                                        Text(getTranslated(context,'faq'),style: AppThemeStyle.buttonWhite16,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(10),
                                        bottom: SizeConfig.calculateBlockVertical(10),
                                        left: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/svg/settings_icon.svg',color: Colors.white),
                                        SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                                        Text(getTranslated(context,'settings'),style: AppThemeStyle.buttonWhite16,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                                InkWell(
                                  onTap: (){
                                    _modalInfo(context,model);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.calculateBlockVertical(10),
                                        bottom: SizeConfig.calculateBlockVertical(10),
                                        left: 10),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/svg/exit_icon.svg',color: Colors.white),
                                        SizedBox(width: SizeConfig.calculateBlockHorizontal(10)),
                                        Text(getTranslated(context, 'close'),style: AppThemeStyle.buttonWhite16,),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(5)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.calculateBlockVertical(25))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.calculateBlockVertical(10)),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Версия 1.21",style: AppThemeStyle.buttonWhite14)
                    ),
                  )
                ],
              ),
            ),
        onModelReady: (model){
          model.getCategory();
        },
        viewModelBuilder: () => DrawerViewModel());
  }

  void _modalInfo(BuildContext context,DrawerViewModel model) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (builder) {
        return BottomModalSheet(
          child: Wrap(
            children: [
              ExitModalView(
                onTapExit: () {
                  model.logOut(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

}

enum DrawerIndex {
  HOME,
  Services,
  Help,
  Share,
  Message,
  Settings,
  About,
  Calendar,
  Report
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.svgName,
  });

  String labelName;
  Icon icon;
  bool isAssetsImage;
  String svgName;
  DrawerIndex index;
}
