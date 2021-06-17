
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/user/user_type.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel{
  ApiProvider  _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  int _radioValue2=0;
  int get radioValue2 => _radioValue2;

  List<UserType> _listType;
  List<UserType> get listType=>_listType;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();
  TextEditingController _usernameController=new TextEditingController();
  TextEditingController _phoneController=new TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get phoneController => _phoneController;

  void handleRadioValueChange(int value){
    _radioValue2=value;
    notifyListeners();
  }

  Future<void> initStates(String username,String email,String password,String phoneNumber) async{
    _usernameController.text=username;
    _emailController.text=email;
    _phoneController.text=phoneNumber;
    _passwordController.text=password;
    notifyListeners();
  }

  Future<void> getUserType() async {
    _isLoading=true;
   _apiProvider.getUserType().then((value) => {
     _listType=value
   }).catchError((onError){
      print("Error: $error");
   }).whenComplete(() => {
      _isLoading=false,
   });
  }

}