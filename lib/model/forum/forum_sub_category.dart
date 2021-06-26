import 'forum_detail.dart';

class ForumSubCategory {
  String name;
  String sysName;
  Language language;
  String category;
  int id;

  ForumSubCategory(
      {this.name, this.sysName, this.language, this.category, this.id});

  ForumSubCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sysName = json['sys_name'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    category = json['category'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sys_name'] = this.sysName;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['category'] = this.category;
    data['id'] = this.id;
    return data;
  }
}