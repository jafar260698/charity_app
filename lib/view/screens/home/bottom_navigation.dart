
import 'package:charity_app/view/screens/home/forum/forum_screen.dart';
import 'package:charity_app/view/screens/home/home_screen.dart';
import 'package:charity_app/view/screens/home/search_screen.dart';
import 'package:charity_app/view/screens/other/favourite_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'article/article_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigation createState() => _BottomNavigation();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _BottomNavigation extends State<BottomNavigation> {
  TextEditingController pinfl = new TextEditingController();
  int selectedItem=0;
  List<Widget> tabs = <Widget>[
    HomeScreen(),
    ArticleScreen(),
    SearchScreen(),
    FavouriteScreen(),
    ForumScreen(),
  ];

  void _onItemTap(int index){
    setState(() {
      selectedItem=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedItem],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        color: Colors.black45,
        activeColor: Color.fromRGBO(98, 190, 184, 1),
        backgroundColor: Colors.white,
        items: [
          TabItem(icon: Ionicons.home_outline),
          TabItem(icon: Icons.menu_book),
          TabItem(icon: FlevaIcons.search),
          TabItem(icon: FlevaIcons.bookmark_outline),
          TabItem(icon: Icons.people_outline),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => {
          _onItemTap(i),
        },
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
          padding: EdgeInsets.only(right: 10),
          child: SvgPicture.asset('assets/svg/Icon_notification_outline.svg',height: 24,width: 24),
        )
      ],
    );
  }

}
