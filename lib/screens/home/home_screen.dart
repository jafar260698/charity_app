
import 'package:carousel_slider/carousel_slider.dart';
import 'package:charity_app/components/text_field_ui.dart';
import 'package:charity_app/screens/home/main_screen.dart';
import 'package:charity_app/screens/home/profile_screen.dart';
import 'package:charity_app/screens/home/search_screen.dart';
import 'package:charity_app/widgets/app_bar_auth.dart';
import 'package:charity_app/widgets/custom/custom_service_category_expansion.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'article_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _HomeScreen extends State<HomeScreen> {
  TextEditingController pinfl = new TextEditingController();

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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                  ),
                  itemCount: (imgList.length / 2).round(),
                  itemBuilder: (context, index, realIdx) {
                    final int first = index * 2;
                    final int second = first + 1;
                    return Row(
                      children: [first, second].map((idx) {
                        return Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Image.network(imgList[idx], fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    );
                  },
                )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFieldUI(
                controller: pinfl,
                text: 'Jafar',
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.done,
                hintText: "Search...",
                suffixIcon: IconButton(
                  splashRadius: 25,
                  onPressed: () {

                  },
                  icon: Icon(FlevaIcons.search),
                ),
              ),
            ),
            // ListView.builder(
            //   padding: const EdgeInsets.only(
            //       bottom: 60.0, left: 13.0, top: 13.0, right: 13.0),
            //   controller: new ScrollController(keepScrollOffset: false),
            //   physics: BouncingScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   itemCount: servicesGroup(context).length,
            //   itemBuilder: (BuildContext context, index) {
            //     return servicesGroup(context)[index];
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        items: [
          TabItem(icon: FlevaIcons.home_outline),
          TabItem(icon: FlevaIcons.book),
          TabItem(icon: FlevaIcons.search),
          TabItem(icon: FlevaIcons.bookmark_outline),
          TabItem(icon: Icons.people_outline),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => {

        },
      ),
    );
  }

  List<Widget> servicesGroup(
      BuildContext context) {
    List<Widget> servicesList = [
      CabinetServiceButton(
        title: 'Нарушения',
        iconPath: "assets/svg/services/medicine.svg",
        onPressed: (){

        },),
      CabinetServiceButton(
        title: 'Нарушения',
        iconPath: "assets/svg/services/medicine.svg",
        onPressed: (){

        },),
      CabinetServiceButton(
        title: 'Нарушения',
        iconPath: "assets/svg/services/medicine.svg",
        onPressed: (){

        },),
      CabinetServiceButton(
        title: 'Нарушения',
        iconPath: "assets/svg/services/medicine.svg",
        onPressed: (){

        },),
      CabinetServiceButton(
        title: 'Нарушения',
        iconPath: "assets/svg/services/medicine.svg",
        onPressed: (){

        },),
      CabinetServiceButton(
        title: 'Нарушения',
        iconPath: "assets/svg/services/medicine.svg",
        onPressed: (){
          //ToastUtils.toastInfo('under_dev', context);
        },),
      CabinetServiceButton(
        title: 'Нарушения',
        iconPath: "assets/svg/services/medicine.svg",
        onPressed: (){

        },),
    ];
    return servicesList;
  }

}
