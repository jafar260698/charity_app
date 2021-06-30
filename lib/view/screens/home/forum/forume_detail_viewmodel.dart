
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/forum/forum_detail.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ForumDetailViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();

  bool _isLoading = false;
  bool get isLoading=> _isLoading;

  ForumDetail _forumDetail;
  ForumDetail get forumDetail=>_forumDetail;

  Future<void> getForumCategory(String subcategory) async{
    _isLoading=true;
    _apiProvider.getForumDetail('kz',subcategory).then((value) => {
      _forumDetail=value,
    }).catchError((error) {
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

}