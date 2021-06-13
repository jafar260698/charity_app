
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'forum_detail.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreen createState() => _ForumScreen();
}

class _ForumScreen extends State<ForumScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.calculateBlockVertical(60)),
          Text(
            'Форум',
            style: AppThemeStyle.headerWhite
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(30)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              child: Container(
                color: Color.fromRGBO(244, 244, 244, 1),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BtnUI(
                          height: 45,
                          align: Alignment.centerLeft,
                          isLoading: false,
                          textColor: Colors.white,
                          color: AppColor.primary,
                          text: 'Специальный форум',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumDetailScreen()));
                          },
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.appBarStyle16,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.titleStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                        BtnUI(
                          height: 45,
                          align: Alignment.centerLeft,
                          isLoading: false,
                          textColor: Colors.white,
                          color: Color.fromRGBO(98, 190, 184, 1),
                          text: 'Специальный форум',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumDetailScreen()));
                          },
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.titleStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.titleStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                        BtnUI(
                          height: 45,
                          align: Alignment.centerLeft,
                          isLoading: false,
                          textColor: Colors.white,
                          color: Color.fromRGBO(98, 190, 184, 1),
                          text: 'Специальный форум',
                          ontap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForumDetailScreen()));
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.titleStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.titleStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.titleStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Информаторий",
                                    style: AppThemeStyle.titleStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  Icon(Icons.arrow_forward_ios,size: 16,)
                                ],
                              ),
                              SizedBox(height:5),
                              Text(
                                "77 тем   Посл. cообщ. 20.02.2021 ",
                                textAlign: TextAlign.start,
                              ),
                              Divider(thickness: 1,color: Colors.black54,),
                              SizedBox(height:5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}