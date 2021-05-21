
import 'package:charity_app/view/components/btn_ui.dart';
import 'package:charity_app/view/screens/home/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PermissionForNotification extends StatefulWidget {
  @override
  _PermissionForNotification createState() => _PermissionForNotification();
}

class _PermissionForNotification extends State<PermissionForNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/permission_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close, color: Colors.white, size: 26),
                  SizedBox(height: 5),
                  Container(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Разрешить уведомления',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            SvgPicture.asset('assets/svg/permission.svg'),
                            SizedBox(height: 20),
                            Text(
                              'Разрешить доступ к уведомлениям для завершения регистрации.',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 30),
                            BtnUI(
                              height: 55,
                              isLoading: false,
                              textColor: Colors.white,
                              color: Color.fromRGBO(98, 190, 184, 1),
                              text: 'Разрешить доступ',
                              ontap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BottomNavigation()));
                              },
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Не разрешать',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
