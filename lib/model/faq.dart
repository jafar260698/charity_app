import 'package:charity_app/model/user/user.dart';

class Faq {
  String title;
  String description;
  Language language;

  Faq({this.title, this.description, this.language});

  Faq.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    return data;
  }
}

