
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/forum/forum_category.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class ForumViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  ForumCategory _forumCategory;
  ForumCategory get forumCategory=>_forumCategory;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getForumCategory() async{
    _isLoading=true;
      _apiProvider.getForumCategory('ru').then((value) => {
        _forumCategory=value
      }).catchError((error) {
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
    });
  }

}