import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/article/article.dart';
import 'package:charity_app/model/user/authorization.dart';
import 'package:charity_app/model/base_response.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/diagnoses.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/model/questionnaire.dart';
import 'package:charity_app/model/skill.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/model/user/user.dart';
import 'package:charity_app/model/user/user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'exceptions.dart';

class ApiProvider {
  Client client = Client();
  UserData _userData = UserData();
  BuildContext context;

  final baseUrl = 'https://ozimplatform.kz/api';
  final baseOFDUrl = 'https://api.ofd.uz/';

  final baseHeader = {
  //  HttpHeaders.authorizationHeader: getVitrinaAuth(),
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

  var headers = {
    'language': 'ru',
    'authorization': '\$2y\$10\$nTX/1eBIlQQ0cu4rjt2ea.axCqSMY65dh./.OX0Vtet3w7dGaYfLW',
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };


  Future<Map<String, dynamic>> baseBody(String type, Map<String, dynamic> params) async{
    Map<String, dynamic> body = new HashMap();
    body['apiType'] = type;
    body['token'] = await _userData.getToken();
    body['params'] = params;
    return body;
  }

  String getQuery(Map<String, dynamic> params) {
    var result = "?";
    params.forEach((key, value) {
      result += '&$key=$value';
    });
    return result;
  }

  String getUrl(String baseUrl, String path, Map<String, dynamic> params) {
    return '$baseUrl$path${getQuery(params)}';
  }


  //user file
  Future<BaseResponses> registration(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/user/registration'),
        headers: headers,
        body: jsonEncode(data)
      );

      print(response.request);
      print(jsonEncode(data));
      print(response.request.headers);
      print(response.request.url);
      print(response.body);
      print(response.statusCode);
      var res = json.decode(response.body.toString());
      print(res);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<User> getUser() async{
    var responseJson;

    try{
      final response= await client.post(Uri.parse('$baseUrl/user'),
          headers: headers,
          body: jsonEncode(null)
      );
      var res=_response(response);
      responseJson=User.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<Authorization> authorization(String username) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/user/authorization?username=$username'),
          headers: headers,
      );
      var res=_response(response);
      responseJson=Authorization.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> getUserLanguage(Map<String,dynamic> data) async{
    var responseJson;

    try{
      final response= await client.post(Uri.parse('$baseUrl/user/language'),
          headers: headers,
          body: jsonEncode(data)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> changeUser(Map<String,dynamic> data) async{
    var responseJson;

    try{
      final response= await client.post(Uri.parse('$baseUrl/user'),
          headers: headers,
          body: jsonEncode(data)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> changeUserAvatar(Map<String,dynamic> data) async{
    var responseJson;

    try{
      final response= await client.post(Uri.parse('$baseUrl/user/avatar/'),
          headers: headers,
          body: jsonEncode(data)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //docs
  Future<BaseResponses> getAgreement() async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/agreement'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> getPolicy() async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/rule'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> postAgreement() async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/agreement/'),
          headers: headers,
          body: jsonEncode(null)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> postPolicy() async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/rule/'),
          headers: headers,
          body: jsonEncode(null)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //language
  Future<Language> getLanguage() async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/language'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Language.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //user type
  Future<List<UserType>> getUserType() async{
    var responseJson;
    try{
      final response=await client.get(Uri.parse("$baseUrl/user_type?language=ru"), headers: headers);

      print(response.request.url);
      print(response.body);
      print(response.statusCode);

      var res=_response(response) as List;
      responseJson=res.map((element)=>UserType.fromJson(element)).toList();

    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //article
  Future<Article> getArticle() async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article?language=ru&category=razvitie&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Article.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<Article> getArticleIndexBookMark() async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/article/index_bookmark?folder=2&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Article.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> articleLike(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/article/like'),
          headers: headers,
          body: jsonEncode(data)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> articleUnlike(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/article/unlike'),
          headers: headers,
          body: jsonEncode(data)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> articleView(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/article/view'),
          headers: headers,
          body: jsonEncode(data)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //article, bookmark, comment

  //article, comment
  Future<SkillProvider> articleComment(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article/comment'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=SkillProvider.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> articleCommentStore(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article/comment/store'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> articleRemoveComment(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article/comment/1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //category
  Future<List<Category>> getCategory(String lang) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/category?language=ru'),
        headers: headers,
      );
      var res=_response(response) as List;
      responseJson=res.map((e) =>Category.fromJson(e)).toList();
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //faq
  Future<List<Faq>> getFaq(String lang) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/faq?language=ru'),
        headers: headers,
      );
      print(response.request.url);
      print(response.body);
      print(response.statusCode);
      var res=_response(response) as List;
      responseJson=res.map((element)=>Faq.fromJson(element)
      ).toList();
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //forum

  //resource
  Future<Links> getLinks(String lang,String category) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/links?language=ru&category=$category&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Links.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //questionnaire
  Future<Questionnaire> getQuestionnaire(String lang) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/questionnaire?language=ru&page=1&category=razvitie'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Questionnaire.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> sendQuestionnaire(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/questionnaire'),
          headers: headers,
          body: jsonEncode(data)
      );
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //diagnoses
  Future<Diagnoses> getDiagnoses(String lang) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/diagnoses?language=ru&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Diagnoses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //skill
  Future<Skill> skill(String lang) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/skill?language=ru&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Skill.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //service_provider
  Future<SkillProvider> serviceProvider(String lang) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/service_provider?language=ru&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=SkillProvider.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //rights
  Future<SkillProvider> rights(String lang) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/rights?language=ru&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=SkillProvider.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //inclusion
  Future<SkillProvider> inclusion(String lang,int page) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/inclusion?language=ru&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=SkillProvider.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }


  String getVitrinaAuth() {
    String username = 'vitrina';
    String password = '321654';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return basicAuth;
  }

  void initContext(BuildContext context){
    this.context = context;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw BadRequestException(response.body.toString());
        break;
      case 401:
        print("401 error");
        Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
        break;
      case 403:
        Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
        break;
      case 500:

      default:
      Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
      break;
    }
  }


}
