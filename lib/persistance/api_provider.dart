import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:charity_app/localization/user_data.dart';
import 'package:charity_app/model/user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'exceptions.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Client client = Client();
  UserData _userData = UserData();
  BuildContext context;

  final baseUrl = 'http://195.210.47.35/';
  final baseOFDUrl = 'https://api.ofd.uz/';

  final baseHeader = {
  //  HttpHeaders.authorizationHeader: getVitrinaAuth(),
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

  var headers = {
    'language': 'ru',
    'Authorization': '\$2y\$10\$nTX/1eBIlQQ0cu4rjt2ea.axCqSMY65dh./.OX0Vtet3w7dGaYfLW'
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


  Future<List<UserType>> getUserType() async{
    var responseJson;

    try{
      final response=await client.get(
         Uri.parse("http://195.210.47.35/api/user_type?language=ru"),
          headers: headers);
      var res=_response(response);
      responseJson=res.map((element)=>UserType.fromJson(element)
      ).toList();

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
