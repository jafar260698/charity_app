

import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/model/skill.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  Skill _skill;
  Skill get skill=>_skill;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getSkill() async{
    _isLoading=true;
    _apiProvider.skill('ru').then((value) => {
      _skill=value,
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

}