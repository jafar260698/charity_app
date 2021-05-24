
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/components/btn_ui_icon.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/get_widget_family.dart';
import '../../widgets/get_widget_logo.dart';
import 'login_screen.dart';


class AccessViaSocialMediaScreen extends StatefulWidget {
  @override
  _AccessViaSocialMediaScreen createState() => _AccessViaSocialMediaScreen();
}

class _AccessViaSocialMediaScreen extends State<AccessViaSocialMediaScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/auth_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: widgetAppBarTitle(context),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SafeArea(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          getWidgetLogoVertical,
                          Padding(
                              padding: EdgeInsets.only(left: 35,right: 35),
                              child: getWidgetLogo),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: false,
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(98, 190, 184, 1),
                                  text: 'Вход через Apple',
                                  icon: SvgPicture.asset('assets/svg/auth/apple.svg'),
                                  ontap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                ),
                                SizedBox(height:8),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: false,
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(240, 131, 144, 1),
                                  text: 'Вход через Google',
                                  icon: SvgPicture.asset('assets/svg/auth/google.svg'),
                                  ontap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                ),
                                SizedBox(height:8),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: false,
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(108, 187, 217, 1),
                                  text: 'Вход через Facebook',
                                  icon: SvgPicture.asset('assets/svg/auth/facebook.svg'),
                                  ontap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                ),
                                SizedBox(height:8),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: false,
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(254, 205, 131, 1),
                                  text: 'Вход через Email',
                                  icon: SvgPicture.asset('assets/svg/auth/email.svg'),
                                  ontap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                ),
                                SizedBox(height:20),
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    'Пользовательское соглашение и политика конфиденциальности',
                                    style: AppThemeStyle.title14,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}