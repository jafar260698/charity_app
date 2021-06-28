
import 'package:charity_app/localization/language_constants.dart';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/forum/forum_detail.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:charity_app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ForumAddViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  TextEditingController _titleController=new TextEditingController();
  TextEditingController _noteController=new TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get noteController => _noteController;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;

  ForumDetail _forumDetail;
  ForumDetail get forumDetail=>_forumDetail;

  Future<void> postForum(BuildContext context,String subCategory) async{
    if(checkTextFieldEmptyOrNot(context)){
      var param =new Map<String,dynamic>();
      param['language']='ru';
      param['subcategory']=subCategory;
      param['title']=titleController.text.toString();
      param['description']=noteController.text.toString();

      _isLoading=true;
      _apiProvider.postForum(param).then((value) => {
        if(value.error==null) {
          ToastUtils.toastInfoGeneral(value.success, context),
          titleController.text='',
          noteController.text='',
    } else  ToastUtils.toastInfoGeneral(value.error, context),

    }).catchError((error) {
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
      });
    }
  }

  bool checkTextFieldEmptyOrNot(BuildContext context){
    if(_titleController.text.isEmpty){
      ToastUtils.toastInfoGeneral(getTranslated(context,'title_is_empty'), context);
      return false;
    }
    if(_noteController.text.isEmpty){
      ToastUtils.toastInfoGeneral(getTranslated(context, 'note_is_empty'), context);
      return false;
    }
    return true;
  }

}