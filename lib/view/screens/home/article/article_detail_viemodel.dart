
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/view/screens/other/comment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';
import 'package:charity_app/model/article/article.dart';


class ArticleDetailViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();
  BuildContext context;
  Data article;


  int articleId;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;

  var _currentIndex = 0;
  int get currentIndex=>_currentIndex;


  void initContext(BuildContext context,Data article){
    this.context = context;
    article=article;
    articleId=article.id;
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
        onShareData(context,'${article.name} \n ${article.description}');
        notifyListeners();
        break;
      case 3:
        break;
    }
    notifyListeners();
  }
  Future<void> onShareData(BuildContext context,String text) async {

    final RenderBox box = context.findRenderObject();
    {
      await Share.share(text,
          subject: text,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  Future<void> articleView() async {
    Map<String,dynamic> data = new Map<String,dynamic>();
    data['article_id']=articleId;
    _isLoading=true;
    _apiProvider.articleView(data).then((value) => {

    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

  Future<void> addLike(int articleId) async {
    Map<String,dynamic> data = new Map<String,dynamic>();
    data['article_id']=articleId;
    _isLoading=true;
    _apiProvider.articleLike(data).then((value) => {

    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

  Future<void> articleDislike(int articleId) async {
    Map<String,dynamic> data = new Map<String,dynamic>();
    data['article_id']=articleId;
    _isLoading=true;
    _apiProvider.articleLike(data).then((value) => {

    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

}