
import 'dart:convert';
import 'dart:io';
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/utils/device_size_config.dart';
import 'package:charity_app/utils/toast_utils.dart';
import 'package:charity_app/view/components/bottom_modal_sheet.dart';
import 'package:charity_app/view/components/btn_ui_icon.dart';
import 'package:charity_app/view/components/text_field_ui.dart';
import 'package:charity_app/view/screens/auth/permission_for_notification.dart';
import 'package:charity_app/view/screens/auth/register_screen.dart';
import 'package:charity_app/view/theme/app_color.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/get_widget_family.dart';
import '../../widgets/get_widget_logo.dart';
import 'package:http/http.dart' as http;


class AccessViaSocialMediaScreen extends StatefulWidget {
  @override
  _AccessViaSocialMediaScreen createState() => _AccessViaSocialMediaScreen();
}

class _AccessViaSocialMediaScreen extends State<AccessViaSocialMediaScreen> {
  ApiProvider  _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  final googleSignIn=GoogleSignIn();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool _isSignIn=false;
  User _user;

  bool _success;
  bool _isLoading=false;
  bool _isLoadingFacebook=false;

  TextEditingController emailController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();

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
                                  color: AppColor.primary,
                                  text: getTranslated(context, 'via_apple'),
                                  icon: SvgPicture.asset('assets/svg/auth/apple.svg'),
                                  ontap: () {
                                    if(Platform.isAndroid){
                                      ToastUtils.toastInfoGeneral("Работает только в приложении для iOS",context);
                                    }else{
                                      // IOS function
                                    }
                                  },
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(8.0)),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: _isSignIn,
                                  textColor: Colors.white,
                                  color: AppColor.google,
                                  text: getTranslated(context,'via_google'),
                                  icon: SvgPicture.asset('assets/svg/auth/google.svg'),
                                  ontap: () {
                                    if(_user!=null){
                                      gotoNextScreen(_user);
                                    }else{
                                      loginViaGoogle();
                                    }
                                  },
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(8.0)),
                                BtnUIIcon(
                                  height: 55,
                                  isLoading: _isLoadingFacebook,
                                  textColor: Colors.white,
                                  color: AppColor.sometimes,
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
                                  color: AppColor.gmail,
                                  text: getTranslated(context,'via_email'),
                                  icon: SvgPicture.asset('assets/svg/auth/gmail.svg'),
                                  ontap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        context: context,
                                        builder: (builder){
                                          return rejectBottomModalSheet(context);
                                        });
                                  },
                                ),
                                SizedBox(height: SizeConfig.calculateBlockVertical(20.0)),
                                InkWell(
                                  onTap: (){
                                    // should open privacy policy page
                                  },
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      getTranslated(context, 'confidential'),
                                      style: TextStyle(
                                        fontSize: SizeConfig.calculateTextSize(14),
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
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
                              print('${user.displayName}');
                            return Text('');
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

  Widget rejectBottomModalSheet(BuildContext context){
    return BottomModalSheet(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldUI(
              controller: emailController,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              inputAction: TextInputAction.done,
              text: getTranslated(context, 'email'),
              hintText: getTranslated(context, 'email_low'),
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(5)),
            TextFieldUI(
              controller: passwordController,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              inputAction: TextInputAction.done,
              text: getTranslated(context, 'password'),
              hintText: getTranslated(context, 'password_low'),
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(30)),
            BtnUIIcon(
              height: 55,
              isLoading: _isLoading,
              textColor: Colors.white,
              color: AppColor.gmail,
              text: getTranslated(context,'via_email'),
              icon: SvgPicture.asset('assets/svg/auth/gmail.svg'),
              ontap: () {
                if(checkTextFieldEmptyOrNot(context)){
                  _signInWithEmailAndPassword();
                }
              },
            ),
            SizedBox(height: SizeConfig.calculateBlockVertical(10)),
          ],
        ),
      ),
    );
  }

  bool checkTextFieldEmptyOrNot(BuildContext context){
    if(passwordController.text.isEmpty){
      ToastUtils.toastInfoGeneral(getTranslated(context,'password_is_empty'), context);
      return false;
    }
    if(emailController.text.isEmpty){
      ToastUtils.toastInfoGeneral(getTranslated(context,'email_is_empty'), context);
      return false;
    }
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text.trim());
    if(!emailValid){
      ToastUtils.toastInfoGeneral(getTranslated(context,'email_not_valid'), context);
      return false;
    }
    return true;
  }


  Future<void> gotoNextScreen(User user) async{
    _apiProvider.authorization(user.email??"").then((value) => {
      print(value),
      _userData.setToken(value.auth_token),
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PermissionForNotification())),
    }).catchError((onError){
      print(onError);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen(username: user.displayName??"",email: user.email??"",password: "",phoneNumber: user.phoneNumber??"",)));
    }).whenComplete(() => {

    });
  }

  Future<void> loginViaGoogle() async{
    setState(() {
      _isSignIn=true;
    });
    final user=await googleSignIn.signIn();
    if(user==null){
      setState(() {
        _isSignIn=false;
      });
    }else{
      final googleAuth=await user.authentication;

      final credential=GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      User userData=FirebaseAuth.instance.currentUser;
      setState(() {
        _isSignIn=false;
      });      gotoNextScreen(userData);
    }
  }

  Future<void> loginViaFacebook() async{
    setState(() {
      _isLoadingFacebook=true;
    });
    FacebookLogin facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(Uri.parse('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}'));
    var profile = jsonDecode(graphResponse.body);
    print(graphResponse.body);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final credential=FacebookAuthProvider.credential(token);
        _auth.signInWithCredential(credential);
        _apiProvider.authorization(profile['email']??"").then((value) => {
          print(value),
          _userData.setToken(value.auth_token),
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PermissionForNotification())),
        }).catchError((onError){
          print(onError);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen(username: profile['name']??"",email: profile['email']??"",password: profile['id']??"",phoneNumber: "",)));
        }).whenComplete(() => {

        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        ToastUtils.toastInfoGeneral("${FacebookLoginStatus.cancelledByUser}", context);
        break;
      case FacebookLoginStatus.error:
        ToastUtils.toastInfoGeneral("${FacebookLoginStatus.error}", context);
        break;
    }

    setState(() {
      _isLoadingFacebook=false;
    });
  }

  Future<void> logOutGoogle() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  void _signInWithEmailAndPassword() async {
    try{
      setState(() {
        _isLoading = true;
      });
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )).user;

      if (user != null) {
        _apiProvider.authorization(user.email??"").then((value) => {
          print(value),
          _userData.setToken(value.auth_token),
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PermissionForNotification())),
        }).catchError((onError){
          print(onError);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen(username: user.displayName??"",email: user.email??"",password: passwordController.text.toString(),phoneNumber: user.phoneNumber??"",)));
        }).whenComplete(() => {

        });
        setState(() {
          _success = true;
        });
      } else {
        setState(() {
          _success = false;
        });
      }

    }catch(ex){
      print("Exception $ex");
      ToastUtils.toastInfoGeneral('Exception: $ex', context);
    }finally{
      setState(() {
        _isLoading = false;
      });
    }

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

