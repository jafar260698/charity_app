
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/card_icon.dart';
import 'package:charity_app/view/screens/home/article/article_screen.dart';
import 'package:charity_app/view/screens/home/diagnose/diagnose_screen.dart';
import 'package:charity_app/view/screens/home/for_mother/for_mother.dart';
import 'package:charity_app/view/screens/home/forum/forum_screen.dart';
import 'package:charity_app/view/screens/home/general_search_screen.dart';
import 'package:charity_app/view/screens/home/home_viewmodel.dart';
import 'package:charity_app/view/screens/home/inclusion/inclusion_screen.dart';
import 'package:charity_app/view/screens/home/resource/resource_screen.dart';
import 'package:charity_app/view/screens/home/rights/rights_screen.dart';
import 'package:charity_app/view/screens/home/service_provider/service_provider_screen.dart';
import 'package:charity_app/view/screens/home/skill/skill_screen.dart';
import 'package:charity_app/view/screens/other/notification/notification_screen.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeWithoutDrawerScreen extends StatelessWidget {

  final List<String> imgList = [
    'assets/image/home_image.png',
    'assets/image/home_image2.png',
    'assets/image/home_image.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) =>  Scaffold(
        appBar: getAppBar(context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.calculateBlockVertical(10)),
              Container(
                height: SizeConfig.calculateBlockVertical(200),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20,right: 10),
                    itemCount: imgList.length,
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: SizeConfig.calculateBlockVertical(200),
                        width: MediaQuery.of(context).size.width*0.85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(imgList[index])
                            ),
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(28)
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GeneralSearchScreen()));
                  },
                  child: TextField(
                    readOnly: true,
                    focusNode: FocusNode(),
                    controller: model.search,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: getTranslated(context,'search'),
                      enabled: false,
                      suffixIcon: IconButton(
                        splashRadius: 25,
                        onPressed: () {

                        },
                        icon: Icon(FlevaIcons.search),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CardIcon(operation:getTranslated(context, 'diagnose'),iconPath:  "assets/svg/services/medicine.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DiagnoseScreen(category: model.category)));
                  }),
                  CardIcon(operation:getTranslated(context,'skills'),iconPath: "assets/svg/services/skill.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkillScreen(category: model.category)));
                  }),
                  CardIcon(operation:getTranslated(context,'resource'),iconPath: "assets/svg/services/resource.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResourceScreen(category: model.category)));
                  }),
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CardIcon(operation:getTranslated(context,'service_provider'),iconPath: "assets/svg/services/service_provider.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ServiceProviderScreen(category: model.category)));
                  }),
                  CardIcon(operation:getTranslated(context,'rules'),iconPath: "assets/svg/services/rules.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RightScreen(category: model.category)));
                  }),
                  CardIcon(operation:getTranslated(context,'inclusion'),iconPath: "assets/svg/services/inclusion.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InclusionScreen(category: model.category)));
                  })
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CardIcon(operation:getTranslated(context,'article'),iconPath: "assets/svg/services/article.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleScreen(category: model.category,existArrow: true,)));
                  }),
                  CardIcon(operation:getTranslated(context,'forum'),iconPath: "assets/svg/services/forum.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumScreen(existArrow: true)));
                  }),
                  CardIcon(operation:getTranslated(context,'for_mother'),iconPath: "assets/svg/services/for_mummy.svg",onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForMotherScreen(category: model.category)));
                  })
                ],
              ),
              SizedBox(height: SizeConfig.calculateBlockVertical(30))
            ],
          ),
        ),
      ),
      onModelReady: (model){
         model.getCategory();
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getAppBar(context) {
    return AppBar(
      elevation: 2.0,
      centerTitle: true,
      shadowColor: Colors.black26,
      automaticallyImplyLeading: false,
      title: Text(''),
      actions: <Widget>[
        IconButton(
          splashRadius: 20,
          iconSize: 30,
          icon: SvgPicture.asset(
            'assets/svg/notifications.svg',
            color: ThemeProvider.themeOf(context).data.accentIconTheme.color,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
        ),
      ],
    );
  }

}