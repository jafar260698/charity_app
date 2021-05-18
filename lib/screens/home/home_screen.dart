
import 'package:charity_app/screens/home/main_screen.dart';
import 'package:charity_app/screens/home/profile_screen.dart';
import 'package:charity_app/screens/home/search_screen.dart';
import 'package:charity_app/widgets/app_bar_auth.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'article_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  List<Widget> tabs = [
    MainScreen(),
    SearchScreen(),
    ArticleScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBarAuthTitle(context),
      body: Center(
          child: TextButton(
            child: Text('Click to show full example'),
            onPressed: () => Navigator.of(context).pushNamed('/bar'),
          )),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        items: [
          TabItem(icon: FlevaIcons.home_outline),
          TabItem(icon: FlevaIcons.book),
          TabItem(icon: FlevaIcons.search),
          TabItem(icon: FlevaIcons.bookmark_outline),
          TabItem(icon: Icons.people_outline),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => {

        },
      ),
    );
  }
}
