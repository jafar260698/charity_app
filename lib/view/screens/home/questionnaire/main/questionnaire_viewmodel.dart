



import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/model/questionnaire.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionnaireViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  Questionnaire _questionnaire;
  Questionnaire get questionnaire=>_questionnaire;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getQuestionnaire() async{
    _isLoading=true;
    var lang= await _userData.getLang();
    _apiProvider.getQuestionnaire(lang,'razvitie').then((value) => {
      _questionnaire=value,
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }


}