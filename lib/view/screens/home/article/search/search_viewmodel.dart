
import 'package:charity_app/model/article/article.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();

  Article _article;
  Article get article=>_article;

  bool _isLoading = true;
  bool get isLoading=> _isLoading;

  Future<void> postSearch(BuildContext context,String search) async {
      _isLoading=true;
      _apiProvider.searchArticle(search).then((value) => {
        _article=value
      }).catchError((error) {
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      });
    }
}