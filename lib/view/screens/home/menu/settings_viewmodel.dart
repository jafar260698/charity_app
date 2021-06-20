

import 'package:charity_app/localization/language.dart';
import 'package:charity_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel{
  BuildContext context;
  int _selectLanguage = 0;
  Language language;
  var langCode = ["uz","ru"];

  int _radioValue = 1;
  int get radioValue=>_radioValue;

  bool _newComment=true;
  bool get newComment=>_newComment;
  bool _replyComment=true;
  bool get replyComment=>_replyComment;
  bool _permissionNotification=true;
  bool get permissionNotification=>_permissionNotification;



  void setContext(BuildContext context) async {
    this.context = context;
  }

  Future<void> newCommentFunc(bool data) async {
    _newComment=data;
    notifyListeners();
  }

  Future<void> replyCommentFunc(bool data) async {
    _replyComment=data;
    notifyListeners();
  }

  Future<void> permissionNotificationFunc(bool data) async {
    if(!data){
      _newComment=data;
      _replyComment=data;
    }
    _permissionNotification=data;
    notifyListeners();
  }


  Future<void> changeLanguage(int position) async {
    _selectLanguage = position;
    Utils.changeLanguage(context, langCode[_selectLanguage]);
  }

  Future<void> handleRadioValueChange(int value) async{
    _radioValue = value;

    switch (_radioValue) {
      case 1:
        changeLanguage(0);
        break;
      case 2:
        changeLanguage(1);
        break;
    }
    notifyListeners();
  }
}