
import 'package:charity_app/model/user/user.dart';

class ForumCategory {
  String name;
  String sysName;
  Language language;
  int id;

  ForumCategory({this.name, this.sysName, this.language,this.id});

  ForumCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sysName = json['sys_name'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    id=json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sys_name'] = this.sysName;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['id']=this.id;
    return data;
  }
}

