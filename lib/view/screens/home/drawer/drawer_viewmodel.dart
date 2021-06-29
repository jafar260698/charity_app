
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/view/screens/auth/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DrawerViewModel extends BaseViewModel{
  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  TextEditingController _search = new TextEditingController();
  TextEditingController get search => _search;

  List<Category> _category;
  List<Category> get category=>_category;


  String _username='';
  String get username=>_username;

  bool _isLoadingCategory = false;
  bool get isLoadingCategory=> _isLoadingCategory;

  Future<void> getCategory() async{
    _isLoadingCategory=true;
    _apiProvider.getCategory("ru").then((value) => {
      _category=value,
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoadingCategory=false,
      notifyListeners()
    });
  }

  Future<void> initData() async{
    _username=  await _userData.getUsername();
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async{
    _userData.clearData();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        SplashScreen()), (Route<dynamic> route) => false);
  }

}