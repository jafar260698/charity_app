
import 'package:charity_app/components/btn_ui.dart';
import 'package:charity_app/screens/home/home_screen.dart';
import 'package:charity_app/widgets/custom/getWidgetLogoHorizontal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PermissionForNotification extends StatefulWidget {
  @override
  _PermissionForNotification createState() => _PermissionForNotification();
}

class _PermissionForNotification extends State<PermissionForNotification> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/permission_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 300,
              height: 250,
              child: Column(
                children: [
                  Icon(Icons.close),
                  SizedBox(height: 5),
                  Container(
                    width: 300,
                    height: 200,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            'Забыли пароль',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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