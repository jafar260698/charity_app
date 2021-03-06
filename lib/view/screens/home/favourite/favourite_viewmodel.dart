
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/article/article.dart';
import 'package:charity_app/model/bookmark.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class FavouriteViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  String token;

  BookMark _article;
  BookMark get article=>_article;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getFavourite() async {
    _isLoading=true;
    token= await _userData.getToken();
    _apiProvider.getBookMark(token).then((value) => {
      _article=value,
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

}