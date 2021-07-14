import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/article/article.dart';
import 'package:charity_app/model/bookmark.dart';
import 'package:charity_app/model/favourite.dart';
import 'package:charity_app/model/forum/forum_category.dart';
import 'package:charity_app/model/forum/forum_detail.dart';
import 'package:charity_app/model/forum/forum_sub_category.dart';
import 'package:charity_app/model/user/authorization.dart';
import 'package:charity_app/model/base_response.dart';
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/diagnoses.dart';
import 'package:charity_app/model/faq.dart';
import 'package:charity_app/model/links.dart';
import 'package:charity_app/model/questionnaire.dart';
import 'package:charity_app/model/skill.dart';
import 'package:charity_app/model/skill_provider.dart';
import 'package:charity_app/model/user/user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

class ApiProvider {
  Client client = Client();
  UserData _userData = UserData();
  BuildContext context;

  final baseUrl = 'https://ozimplatform.kz/api';

  final baseHeader = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };
  // default '\$2y\$10\$nTX/1eBIlQQ0cu4rjt2ea.axCqSMY65dh./.OX0Vtet3w7dGaYfLW'
  var headers = {
    'language': 'ru',
    'authorization': '\$2y\$10\$nTX/1eBIlQQ0cu4rjt2ea.axCqSMY65dh./.OX0Vtet3w7dGaYfLW',
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };


  static Future<String> getToken() async {
    var token = await UserData().getToken();
    return token;
  }

  static Future<String> getLang() async {
    var lang = await UserData().getLang();
    return lang;
  }

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

  Future<User> getUser(String token) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/user'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            'language': 'ru',
           'authorization': token,
          },
      );

      print(response.request);
      print(response.request.headers);
      print(response.request.url);
      print(response.body.toString());
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
          headers: {
            'language': 'ru',
            'authorization': 'null',
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
      );
      print(response.request);
      print(response.request.headers);
      print(response.request.url);
      print(response.body.toString());
      print(response.statusCode);
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

  Future<BaseResponses> changeUser(Map<String,dynamic> data,String token) async{
    var responseJson;

    try{
      final response= await client.post(Uri.parse('$baseUrl/user'),
          headers: {
            'language': 'ru',
            'authorization': token,
            HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
          },
          body: jsonEncode(data)
      );

      print(response.request);
      print(jsonEncode(data));
      print(response.request.headers);
      print(response.request.url);
      print(response.body);
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> changeUserAvatar(File file,String filepath,String token) async{
    var responseJson;

    try{

      var uri = Uri.parse('$baseUrl/user/avatar/');
      var request = new http.MultipartRequest("POST", uri);
      //request.files.add(new http.MultipartFile.fromBytes('avatar', await File.fromUri(Uri.parse(filepath)).readAsBytes(), contentType: MediaType('image', 'jpeg')));

      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          'avatar', filepath);

      request.files.add(multipartFile);

      http.Response response = await http.Response.fromStream(await request.send());

      print(response.request.url);
      print(response.request.headers.toString());
      print(response.statusCode);
      print(response.body);

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
  Future<Article> getArticle(String lang,String category) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article?language=$lang&category=$category&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Article.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<Article> searchArticle(String search) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article/search?search=$search&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=Article.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<Article> getArticleIndexBookMark(String folder) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/article/index_bookmark?folder=$folder&page=1'),
        headers: headers,
      );
      print(response.request.url);
      print(response.request.headers.toString());

      var res=_response(response);
      responseJson=Favourite.fromJson(res);
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

  Future<BaseResponses> articleDislike(Map<String,dynamic> data) async{
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
      print(response.request.url);
      print(response.body);
      print(response.headers);
      var res=_response(response);
      responseJson=BaseResponses.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  //article, bookmark, comment
  Future<BookMark> getBookMark(String token) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article/bookmark?page=1'),
          headers: headers
      );
      var res=_response(response);
      responseJson=BookMark.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> bookMarkStore(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/article/bookmark/store'),
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

  Future<BaseResponses> bookMarkUpdate(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/article/bookmark/update'),
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

  Future<BaseResponses> bookMarkDelete(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/article/bookmark/update'),
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

  //article, comment
  Future<SkillProvider> articleComment(String lang) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/article/comment'),
        headers: headers,
      );
      print(response.request.url);
      print(response.body);
      print(response.headers);

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

  // forum
  Future<List<ForumCategory>> getForumCategory(String lang) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/forum_category?language=$lang'),
        headers: headers,
      );
      print(response.request.url);
      print(response.request.headers.toString());

      var res=_response(response) as List;
      responseJson=res.map((e) =>ForumCategory.fromJson(e)).toList();
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<List<ForumSubCategory>> getForumSubCategory(String lang) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/forum_subcategory?language=$lang'),
        headers: headers,
      );

      print(response.request.url);
      print(response.request.headers.toString());
      var res=_response(response) as List;
      responseJson=res.map((e) =>ForumSubCategory.fromJson(e)).toList();
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<ForumDetail> getForumDetail(String lang,String subcategory) async{
    var responseJson;
    try{
      final response= await client.get(Uri.parse('$baseUrl/forum?language=$lang&subcategory=$subcategory&page=1'),
        headers: headers,
      );
      print(response.headers);
      print(response.request.url);
      var res=_response(response);
      responseJson=ForumDetail.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<BaseResponses> postForum(Map<String,dynamic> data) async{
    var responseJson;
    try{
      final response= await client.post(Uri.parse('$baseUrl/forum'),
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
  Future<Questionnaire> getQuestionnaire(String lang,String category) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/questionnaire?language=$lang&page=1&category=$category'),
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
      final response= await client.get(Uri.parse('$baseUrl/diagnoses?language=$lang&page=1'),
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

  //for_mother
  Future<SkillProvider> forMother(String lang,int page,String category) async{
    var responseJson;

    try{
      final response= await client.get(Uri.parse('$baseUrl/for_parent?language=ru&category=$category&page=1'),
        headers: headers,
      );
      var res=_response(response);
      responseJson=SkillProvider.fromJson(res);
    } on FetchDataException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
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
