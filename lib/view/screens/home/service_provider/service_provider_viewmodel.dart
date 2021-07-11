

import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceProviderViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  SkillProvider _links;
  SkillProvider get links=>_links;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getServiceProvider() async{
    _isLoading=true;
    var lang= await _userData.getLang();
    _apiProvider.serviceProvider(lang).then((value) => {
      _links=value,
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

}