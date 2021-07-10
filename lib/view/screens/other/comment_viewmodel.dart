
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';

class CommentViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SkillProvider _comment;
  SkillProvider get comment=>_comment;

  Future<void> getComment() async {
    _isLoading=true;
    _userData.getLang().then((value) => {
      _apiProvider.articleComment(value).then((value) => {
        _comment=value,
      }).catchError((error) {
        print("Error: $error");

      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      }),
    });
  }

  Future<void> writeComment(String id) async {
    Map<String,dynamic> data=new Map<String,dynamic>();
    data['article_id']=1;
    data['comment_id']=1;
    data['text']="Коммент";

    _isLoading=true;
      _apiProvider.articleCommentStore(data).then((value) => {

      }).catchError((error) {
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      });
  }

  Future<void> removeComment(String id) async {
    _isLoading=true;
    _userData.getLang().then((value) => {
      _apiProvider.articleComment(value).then((value) => {
        _comment=value,
      }).catchError((error) {
        print("Error: $error");

      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      }),
    });
  }

}