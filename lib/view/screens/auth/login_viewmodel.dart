

import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/view/screens/auth/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel{

  ApiProvider  _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;


  Future<void> login(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

}