
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel{
  ApiProvider  _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  bool _isLoading = false;
  bool get isLoading=> _isLoading;

}