
import 'package:charity_app/model/category.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/view/screens/home/forum/forum_screen.dart';
import 'package:charity_app/view/screens/home/home_screen.dart';
import 'package:charity_app/view/screens/home/article/search/search_screen.dart';
import 'package:charity_app/view/screens/home/favourite/favourite_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
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

class _BottomNavigation extends State<BottomNavigation> {
  int selectedItem=0;
  ApiProvider _apiProvider=new ApiProvider();
  List<Category> _category=[];

  void _onItemTap(int index){
    setState(() {
      selectedItem=index;
    });
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = <Widget>[
      HomeScreen(),
      ArticleScreen(category: _category,existArrow: false),
      SearchScreen(),
      FavouriteScreen(category: _category),
      ForumScreen(existArrow: false),
    ];
    return Scaffold(
      body: tabs[selectedItem],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        color: Colors.black45,
        activeColor: AppColor.primary,
        elevation: 0,
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

  Future<void> getCategory() async{
    _apiProvider.getCategory("ru").then((value) => {
        setState(() {
          _category=value;
        }),
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {

    });

  }
}
