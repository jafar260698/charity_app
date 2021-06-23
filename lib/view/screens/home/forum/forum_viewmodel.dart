
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class ForumViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  bool _isLoading = true;
  bool get isLoading=> _isLoading;


  Future<void> getFaqData() async{
    _isLoading=true;
    _userData.getLang().then((value) => {
      _apiProvider.getFaq(value).then((value) => {
        _faq=value,
      }).catchError((error) {
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      }),
    });
  }

}