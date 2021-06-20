
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/auth/permission_for_notification.dart';
import 'package:charity_app/view/screens/auth/register_viewmodel.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:charity_app/view/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterScreen extends StatelessWidget {
  final String username;
  final String email;
  final String phoneNumber;
  final String password;

  RegisterScreen({Key key,this.username, this.email, this.phoneNumber, this.password}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder:(context,model,child)=> Material(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/register_background.png"),
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
                          child: getWidgetLogoHorizontal
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(30)),
                    Text(
                      getTranslated(context, 'add_account'),
                      style: TextStyle(
                        fontSize: 24.0,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(15)),
                    TextField(
                      controller: model.usernameController,
                      decoration: InputDecoration(
                        hintText: getTranslated(context, 'username'),
                        hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                        prefixIcon: Icon(Icons.person_outline,color: Colors.white),
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
                    TextField(
                      controller: model.emailController,
                      decoration: InputDecoration(
                        hintText: getTranslated(context,'email'),
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
                      controller: model.phoneController,
                      decoration: InputDecoration(
                        hintText: getTranslated(context, 'phone_number'),
                        hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                        prefixIcon: Icon(Icons.call_outlined,color: Colors.white),
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
                    SizedBox(height: SizeConfig.calculateBlockVertical(80)),
                    TextField(
                      readOnly: true,
                      focusNode: FocusNode(),
                      decoration: InputDecoration(
                        hintText: getTranslated(context, 'user_type'),
                        enabled: false,
                        hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                        prefixIcon: Icon(Icons.person,color: AppThemeStyle.primaryColor,),
                        suffixIcon: Icon(Icons.keyboard_arrow_up_outlined,size: 30,color: AppThemeStyle.primaryColor,),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppThemeStyle.primaryColor,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                              value: 0,
                              activeColor:AppThemeStyle.primaryColor,
                              groupValue: model.radioValue2,
                              onChanged: model.handleRadioValueChange,
                            ),
                          ),
                          new Text(
                            getTranslated(context, 'parents'),
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],),
                        Row(children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                              value: 1,
                              groupValue: model.radioValue2,
                              activeColor:AppThemeStyle.primaryColor,
                              onChanged: model.handleRadioValueChange,
                            ),
                          ),
                          new Text(
                            getTranslated(context,'specialist'),
                            style: new TextStyle(fontSize: 16.0),
                          )
                        ],),
                        Row(children: [
                          Transform.scale(
                            scale: 1.5,
                            child: new Radio(
                              value: 2,
                              activeColor:AppThemeStyle.primaryColor,
                              groupValue: model.radioValue2,
                              onChanged: model.handleRadioValueChange,
                            ),
                          ),
                          new Text(
                            getTranslated(context, 'organization'),
                            style: new TextStyle(fontSize: 16.0),
                          ),
                        ],),
                      ],
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(30)),
                    BtnUI(
                      height: 55,
                      isLoading: model.isLoading,
                      textColor: Colors.white,
                      color: AppThemeStyle.primaryColor,
                      text: getTranslated(context, 'create'),
                      ontap: () {
                         model.registration(context);
                         //Navigator.of(context).push(MaterialPageRoute(builder: (context) => PermissionForNotification()));
                      },
                    ),
                    SizedBox(height: SizeConfig.calculateBlockVertical(20)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      onModelReady: (model){
        if(username!=null){
           model.initStates(username, email, password, phoneNumber);
        }
        model.getUserType(context);
      },
      viewModelBuilder:()=> RegisterViewModel(),
    );
  }

}