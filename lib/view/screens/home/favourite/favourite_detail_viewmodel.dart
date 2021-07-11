
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/article/article.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class FavouriteDetailViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  Article _article;
  Article get article=>_article;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getFavourite(String category) async {
    _isLoading=true;
    _apiProvider.getArticle(category).then((value) => {

    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

}