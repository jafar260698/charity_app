


import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class ResourceViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  List<Faq> _faq;
  List<Faq> get faq=>_faq;

  bool _isLoading = true;
  bool get isLoading=> _isLoading;


  Future<void> getCategory() async{
    _isLoading=true;
      _apiProvider.getCategory("ru").then((value) => {
      }).catchError((error){
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
    });
  }

}