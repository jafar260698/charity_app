
import 'dart:convert';
import 'dart:io';
import 'package:charity_app/localization/language.dart';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel{
  UserData _userData=new UserData();
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

  String _lang='';
  String get lang=>_lang;

  String _username='';
  String get username=>_username;

  // image settings
  File _imageFile;
  final _picker = ImagePicker();
  var fileName = "", fileSource, fileSize, fileExt;

  void setContext(BuildContext context) async {
    this.context = context;
    initData();
  }

  Future<void> initData()async{
    _lang= await _userData.getLang();
    if(_lang=="ru"){
      _radioValue=2;
    }else{
      _radioValue=1;
    }
    _username=  await _userData.getUsername();
    notifyListeners();
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


  Future<void> pickFile() async {
    final PickedFile pickedFile =
    await _picker.getImage(source: ImageSource.gallery, imageQuality: 30);
    _imagePicked(pickedFile);
  }

  Future<void> _imagePicked(PickedFile pickedFile) async {
    var tempImage = File(pickedFile.path);
    _imageFile = tempImage;
    notifyListeners();
    if (tempImage != null) {
      fileSize = tempImage.lengthSync().toString();
      var byt = tempImage.readAsBytesSync();
      fileSource = base64Encode(byt);
      fileName = pickedFile.path.split("/").last;
      fileExt = fileName.split(".").last;

      print("image/$fileExt  Filesize $fileSize Filename $fileName");
      notifyListeners();
    //  _uploadFile("uz", "image/$fileExt", "185", fileSize, fileName, fileSource);
    }
  }

}