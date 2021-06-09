
import 'dart:io';

import 'package:charity_app/utils/toast_utils.dart';
import 'package:charity_app/view/components/btn_ui_icon.dart';
import 'package:charity_app/view/theme/themes.dart';
import 'package:charity_app/view/widgets/app_bar_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/get_widget_family.dart';
import '../../widgets/get_widget_logo.dart';
import 'login_screen.dart';


class AccessViaSocialMediaScreen extends StatefulWidget {
  @override
  _AccessViaSocialMediaScreen createState() => _AccessViaSocialMediaScreen();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class _AccessViaSocialMediaScreen extends State<AccessViaSocialMediaScreen> {
  GoogleSignInAccount _currentUser;
  String _contactText = '';


  // @override
  // void initState() {
  //   super.initState();
  //   _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
  //     setState(() {
  //       _currentUser = account;
  //     });
  //     if (_currentUser != null) {
  //       _handleGetContact(_currentUser);
  //     }
  //   });
  //   _googleSignIn.signInSilently();
  // }
  //
  // Future<void> _handleGetContact(GoogleSignInAccount user) async {
  //   setState(() {
  //     _contactText = "Loading contact info...";
  //   });
  //   final http.Response response = await http.get(
  //     Uri.parse('https://people.googleapis.com/v1/people/me/connections'
  //         '?requestMask.includeField=person.names'),
  //     headers: await user.authHeaders,
  //   );
  //   if (response.statusCode != 200) {
  //     setState(() {
  //       _contactText = "People API gave a ${response.statusCode} "
  //           "response. Check logs for details.";
  //     });
  //     print('People API ${response.statusCode} response: ${response.body}');
  //     return;
  //   }
  //   final Map<String, dynamic> data = json.decode(response.body);
  //   final String? namedContact = _pickFirstNamedContact(data);
  //   setState(() {
  //     if (namedContact != null) {
  //       _contactText = "I see you know $namedContact!";
  //     } else {
  //       _contactText = "No contacts to display.";
  //     }
  //   });
  // }
  //
  // String? _pickFirstNamedContact(Map<String, dynamic> data) {
  //   final List<dynamic>? connections = data['connections'];
  //   final Map<String, dynamic>? contact = connections?.firstWhere(
  //         (dynamic contact) => contact['names'] != null,
  //     orElse: () => null,
  //   );
  //   if (contact != null) {
  //     final Map<String, dynamic>? name = contact['names'].firstWhere(
  //           (dynamic name) => name['displayName'] != null,
  //       orElse: () => null,
  //     );
  //     if (name != null) {
  //       return name['displayName'];
  //     }
  //   }
  //   return null;
  // }
  //
  //
  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

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
                                    if(Platform.isAndroid){
                                      ToastUtils.toastInfoGeneral("This is not IOS Phone",context);
                                    }
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
                                    _handleSignIn();
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
                                  icon: SvgPicture.asset('assets/svg/auth/gmail.svg'),
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
                                ),
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

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}