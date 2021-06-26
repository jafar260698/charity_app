
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/forum/forum_category.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel{
  ApiProvider _apiProvider=new ApiProvider();

  TextEditingController _search = new TextEditingController();
  TextEditingController get search => _search;

  List<Category> _category;
  List<Category> get category=>_category;

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

}