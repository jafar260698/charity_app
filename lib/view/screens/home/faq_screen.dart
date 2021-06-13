
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreen createState() => _FaqScreen();
}

class _FaqScreen extends State<FaqScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeStyle.primaryColor,
      appBar: widgetAppBarTitle(context),
      body: Column(
        children: <Widget>[
          Text(
            getTranslated(context, 'faq'),
            style: TextStyle(
                fontSize: 24.0,
                letterSpacing: 0.4,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          SizedBox(height: SizeConfig.calculateBlockVertical(30)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.white,
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Каково глобальное бремя болезни, ассоциированное с ВГВ?",
                                          style: AppThemeStyle.titleFormStyle,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: AppThemeStyle.primaryColor,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "По оценкам ВОЗ, в настоящее время в мире насчитывается 257 млн человек, живущих с хронической инфекцией гепатита В и, следовательно, подверженных риску серьезного заболевания и смерти от цирроза и рака печени. Каждый год от хронического вирусного гепатита В, по оценкам ВОЗ, умирает почти 900 000 человек, главным образом в результате вызванных гепатитом осложнений, таких как цирроз и рак печени. Страны с наибольшей распространенностью гепатита В расположены в Регионе Западной части Тихого океана и Африканском регионе ВОЗ, а с наименьшей – в Регионе стран Америки и Европейском регионе.,",
                            style: AppThemeStyle.titleFormStyle,
                            textAlign: TextAlign.start,
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        color: Colors.black45,
        activeColor: AppThemeStyle.primaryColor,
        backgroundColor: Colors.white,
        items: [
          TabItem(icon: Icon(Icons.add,color: Colors.white,)
          ),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => {
        },
      ),
    );
  }

}