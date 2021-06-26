
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/forum/forum_detail.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class ForumAddViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  bool _isLoading = false;
  bool get isLoading=> _isLoading;

  ForumDetail _forumDetail;
  ForumDetail get forumDetail=>_forumDetail;

  Future<void> postForum() async{
    var param =new Map<String,dynamic>();
    _isLoading=true;
    _apiProvider.postForum(param).then((value) => {

    }).catchError((error) {
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

}