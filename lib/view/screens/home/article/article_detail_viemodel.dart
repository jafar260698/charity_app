



import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  SkillProvider _skillProvider;
  SkillProvider get skillProvider=>_skillProvider;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getInclusion() async{
    _isLoading=true;
    _apiProvider.inclusion('ru',1).then((value) => {
      _skillProvider=value,
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }


}