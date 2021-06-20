
import 'dart:io';
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/toast_utils.dart';
import 'package:charity_app/view/components/btn_ui_icon.dart';
import 'package:charity_app/view/screens/auth/register_screen.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/get_widget_family.dart';
import '../../widgets/get_widget_logo.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;


class AccessViaSocialMediaScreen extends StatefulWidget {
  @override
  _AccessViaSocialMediaScreen createState() => _AccessViaSocialMediaScreen();
}

class _AccessViaSocialMediaScreen extends State<AccessViaSocialMediaScreen> {
  final googleSignIn=GoogleSignIn();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool _isSignIn=false;
  User _user;


  @override
  Widget build(BuildContext context) {
    return Container(
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
                          SizedBox(height: SizeConfig.calculateBlockVertical(10.0)),
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
                                  text: getTranslated(context, 'via_apple'),
                                  icon: SvgPicture.asset('assets/svg/auth/apple.svg'),
                                  ontap: () {
                                    if(Platform.isAndroid){
                                      ToastUtils.toastInfoGeneral("This is not IOS Phone",context);
                                    }
                                  },
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(8.0)),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: false,
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(240, 131, 144, 1),
                                  text: getTranslated(context,'via_google'),
                                  icon: SvgPicture.asset('assets/svg/auth/google.svg'),
                                  ontap: () {
                                    loginViaGoogle();
                                    if(_user!=null){
                                      gotoNextScreen(_user);
                                    }else{

                                    }
                                  },
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(8.0)),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: false,
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(108, 187, 217, 1),
                                  text: getTranslated(context,'via_facebook'),
                                  icon: SvgPicture.asset('assets/svg/auth/facebook.svg'),
                                  ontap: () {
                                    loginViaFacebook();
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(8.0)),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: false,
                                  textColor: Colors.white,
                                  color: Color.fromRGBO(254, 205, 131, 1),
                                  text: getTranslated(context,'via_email'),
                                  icon: SvgPicture.asset('assets/svg/auth/gmail.svg'),
                                  ontap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(20.0)),
                                Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    getTranslated(context, 'confidential'),
                                    style: AppThemeStyle.title14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            User user=FirebaseAuth.instance.currentUser;
                              _user=user;
                            return Text('${user.displayName}');
                          }
                          return Text('');
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }

  Future<void> gotoNextScreen(User user) async{
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen(username: user.displayName??"",email: user.email??"",password: user.uid??"",phoneNumber: user.phoneNumber??"",)));
  }

  Future<void> loginViaGoogle() async{
    _isSignIn=true;
    final user=await googleSignIn.signIn();
    if(user==null){
      _isSignIn=false;
    }else{
      final googleAuth=await user.authentication;

      final credential=GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      _isSignIn=false;
    }
  }

  Future<void> loginViaFacebook() async{
    FacebookLogin facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
    //final profile = JSON.decode(graphResponse.body);
    print(graphResponse.body);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final credential=FacebookAuthProvider.credential(token);
        _auth.signInWithCredential(credential);
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }

  Future<void> logOutGoogle() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }


}

