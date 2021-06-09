import 'package:charity_app/view/theme/my_themes.dart';
import 'package:charity_app/view/widgets/custom/custom_toast.dart';
import 'package:charity_app/view/widgets/custom/custom_toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastUtils{

  static toastInfoGeneral(String message, BuildContext context) {
    CustomToast(
      context,
      color: MyThemes.darkTheme.primaryColor,
      borderRadius: 16.0,
      icon: Icon(Icons.info_outline_rounded, color: Colors.white),
      title: message,
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static toastSuccessGeneral(String message, BuildContext context) {
    CustomToast(
      context,
      typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      color: Colors.green,
      borderRadius: 16.0,
      icon: Icon(Icons.check_circle_outline_outlined, color: Colors.white),
      title: message,
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static toastErrorGeneral(String message, BuildContext context) {
    CustomToast(
      context,
      typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
      color: Colors.redAccent,
      borderRadius: 16.0,
      icon: Icon(Icons.close, color: Colors.white),
      title: message,
      isCircle: false,
      listener: (status) {
        print(status);
      },
    )..show();
  }

  static longTopGeneral(String message, BuildContext context){
    Toast.show(message, context, duration: 2, gravity: 2);
  }

  static longCenterGeneral(String message, BuildContext context){
    Toast.show(message, context, duration: 2, gravity: 1);
  }

  static longBottomGeneral(String message, BuildContext context){
    Toast.show(message, context, duration: 2, gravity: 0);
  }

}