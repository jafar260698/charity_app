
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/user/user_type.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel{
  ApiProvider  _apiProvider=new ApiProvider();
  String type;

  int _radioValue2=0;
  int get radioValue2 => _radioValue2;

  List<UserType> _listType;
  List<UserType> get listType=>_listType;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;

  var _phoneController = new MaskedTextController(
      text: '+', mask: '+0-000-000-00-00');


  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();
  TextEditingController _usernameController=new TextEditingController();

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

  Future<void> getUserType(BuildContext context) async {
    _isLoading=true;
   _apiProvider.getUserType().then((value) => {
     _listType=value
   }).catchError((onError){
     ToastUtils.toastErrorGeneral('$onError', context);
   }).whenComplete(() => {
      _isLoading=false,
   });
  }

  Future<void> registration(BuildContext context) async{
    if(checkTextFieldEmptyOrNot(context)){
      _isLoading=true;
      notifyListeners();
    switch(_radioValue2){
        case 0: type="parent"; break;
        case 1: type="specialist"; break;
        case 2: type="organization"; break;
        default: type="parent"; break;
      }

      Map<String,dynamic> data= Map<String,dynamic>();
      data["phone"]=_phoneController.text;
      data["name"]=_usernameController.text;
      data["email"]=_emailController.text;
      data["password"]=_passwordController.text;
      data["type"]=type;
      data["language"]='ru';

      _apiProvider.registration(data).then((value) => {
        if(value.error!=null){
          ToastUtils.toastErrorGeneral(value.error, context),
        }else{
          ToastUtils.toastErrorGeneral(value.success, context),
        }
      }).catchError((onError){
        ToastUtils.toastErrorGeneral('$onError', context);
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners(),
      });
    }
  }

  bool checkTextFieldEmptyOrNot(BuildContext context){
    if(_usernameController.text.isEmpty){
      ToastUtils.toastInfoGeneral('Username must not be empty', context);
      return false;
    }
    if(_passwordController.text.isEmpty){
      ToastUtils.toastInfoGeneral('Password must not be empty', context);
      return false;
    }
    if(_emailController.text.isEmpty){
      ToastUtils.toastInfoGeneral('Email must not be empty', context);
      return false;
    }
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.trim());
    if(!emailValid){
      ToastUtils.toastInfoGeneral('Please add valid email', context);
      return false;
    }
    if(_phoneController.text.isEmpty){
      ToastUtils.toastInfoGeneral('Phone number must not be empty', context);
      return false;
    }
    return true;
  }

}