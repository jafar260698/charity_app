

import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/avatar_iamge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(108, 187, 217, 1),
      appBar: widgetAppBarTitle(context),
      body: Column(
        children: <Widget>[
          SizedBox(height: 45),
          InkWell(
            onTap: (){ },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 30),
                AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:70.0),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Бибигуль Ахметова",
                    textAlign: TextAlign.start,
                    style: AppThemeStyle.listStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(height: 30,),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: Color.fromRGBO(244, 244, 244, 1),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AvatarImage(imageUrl: 'https://news.berkeley.edu/wp-content/uploads/2020/03/Maryam-Karimi-01-750.jpg',size:60.0),
                          SizedBox(width: 30,),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  children: [
                                    Text(
                                      "Бибигуль Ахметова",
                                      style: AppThemeStyle.appBarStyle16,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Жаль, что журналистка поленилась поинтересоваться, кто разрабатывал эти костюмы. Их разработал и внедрил в практику здравоохранения Государственный научный центр РФ - Институт медико- биологических проблем РАН. В 2009 году ученым этого института была присуждена награда «Врач года» как раз за этот костюм.",
                                    ),
                                    SizedBox(height:5),
                                    Divider(thickness: 2,color: Colors.black54,),
                                    SizedBox(height:5),
                                    Text(
                                      "15 ch... atvetit",
                                    ),
                                    SizedBox(height: 10)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
