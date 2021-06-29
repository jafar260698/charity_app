
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/forum/forum_category.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  String _username='';
  String get username=>_username;

  String _imagePath='';
  String get imagePath=>_imagePath;

  TextEditingController _search = new TextEditingController();
  TextEditingController get search => _search;

  List<Category> _category;
  List<Category> get category=>_category;

  bool _isLoadingCategory = false;
  bool get isLoadingCategory=> _isLoadingCategory;

  Future<void> initData() async{
     _username=  await _userData.getUsername();
     notifyListeners();
  }

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

}