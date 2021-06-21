
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ChangeUsernameModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();


  TextEditingController _userController=new TextEditingController();
  TextEditingController get userController => _userController;

  bool _isLoading = true;
  bool get isLoading=> _isLoading;


  Future<void> getFaqData() async{
    _isLoading=true;
    _userData.getLang().then((value) => {
      _apiProvider.getFaq(value).then((value) => {

      }).catchError((error) {
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      }),
    });
  }

}