
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ChangeUsernameModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();


  TextEditingController _userController=new TextEditingController();
  TextEditingController get userController => _userController;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> changeUsername(BuildContext context) async{
    _isLoading=true;
    notifyListeners();
    Map<String,dynamic> data=new Map<String,dynamic>();
    data['name']=_userController.text.toString().trim();
    _userData.getToken().then((value) => {
      _apiProvider.changeUser(data,value).then((value) => {
        print("${value.success}"),
        if(value.error==null){
          _userData.setUsername(_userController.text.toString().trim()),
          ToastUtils.toastInfoGeneral("Successfully added", context),
          Navigator.of(context).pop(),
        }
      }).catchError((error) {
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      }),
    });
  }

}