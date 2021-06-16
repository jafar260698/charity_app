
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/auth/login_viewmodel.dart';
import 'package:charity_app/view/screens/auth/register_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder:(context,model,child)=> Material(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/login_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: widgetAppBarTitle(context),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 25,right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Align(
                          alignment: Alignment.center,
                          child: getWidgetLogoHorizontal),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(30)),
                    Text(
                      getTranslated(context, 'enter'),
                      style: TextStyle(
                        fontSize: 26.0,
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(15)),
                    TextField(
                      controller: model.emailController,
                      decoration: InputDecoration(
                        hintText: getTranslated(context, 'email'),
                        hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                        prefixIcon: Icon(FlevaIcons.email_outline,color: Colors.white),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                          ),
                        ),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                    TextField(
                      controller: model.passwordController,
                      decoration: InputDecoration(
                        hintText: getTranslated(context, 'password'),
                        hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                        prefixIcon: Icon(Icons.lock_outline,color: Colors.white),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                          ),
                        ),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                    Text(
                      getTranslated(context, 'forgot_password'),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(120)),
                    BtnUI(
                      height: 55,
                      isLoading: false,
                      textColor: Colors.white,
                      color: AppThemeStyle.primaryColor,
                      text: getTranslated(context, 'enter'),
                      ontap: () {
                        model.login(context);
                      },
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(50)),
                    SvgPicture.asset('assets/svg/welcome.svg',height: SizeConfig.calculateBlockVertical(200)),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Opacity(
                          opacity: 0.5,
                          child: Text(
                            getTranslated(context,'no_account'),
                            style: AppThemeStyle.title12,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(10)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: ()=>LoginViewModel(),
    );
  }
}