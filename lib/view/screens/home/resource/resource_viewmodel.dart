


import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/persistance/api_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceViewModel extends BaseViewModel{

  ApiProvider _apiProvider=new ApiProvider();
  UserData _userData=new UserData();

  Links _links;
  Links get links=>_links;

  List<Faq> _faq;
  List<Faq> get faq=>_faq;

  bool _isLoading = false;
  bool get isLoading=> _isLoading;


  Future<void> getCategory() async{
    _isLoading=true;
      _apiProvider.getCategory("ru").then((value) => {
      }).catchError((error){
        print("Error: $error");
      }).whenComplete(() => {
        _isLoading=false,
        notifyListeners()
    });
  }

  Future<void> getLinks(String category) async{
    _isLoading=true;
    _apiProvider.getLinks('ru',category).then((value) => {
      _links=value,
    }).catchError((error){
      print("Error: $error");
    }).whenComplete(() => {
      _isLoading=false,
      notifyListeners()
    });
  }

  Future<void> launchURL(String url) async {
    if(!url.contains('http://')&&!url.contains('https://')){
     url= "https://" + url;
    }
    print(url);
    if (await canLaunch(url.trim())) {
      await launch(url);
    } else {
      throw 'Ishga tushirilmadi $url';
    }
  }

}