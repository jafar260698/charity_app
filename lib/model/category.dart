
import 'package:charity_app/model/user.dart';

class Category {
  String name;
  String sysName;
  Language language;

  Category({this.name, this.sysName, this.language});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sysName = json['sys_name'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sys_name'] = this.sysName;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}

