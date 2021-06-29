



import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/view/screens/other/comment_screen.dart';
import 'package:charity_app/view/screens/other/notification/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();
  BuildContext context;

  SkillProvider _skillProvider;
  SkillProvider get skillProvider=>_skillProvider;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;

  var _currentIndex = 0;
  int get currentIndex=>_currentIndex;


  void initContext(BuildContext context){
    this.context = context;
  }

  Future<void> onTabTapped(int index) async{
    _currentIndex=index;
    print(index);
    switch(index){
      case 0:
        break;
      case 1:
        {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CommentScreen()));
          break;
        }
      case 2:
        break;
      case 3:
        break;
    }
    notifyListeners();
  }

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