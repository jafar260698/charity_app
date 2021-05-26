
import 'package:charity_app/model/category.dart';
import 'package:charity_app/model/user.dart';

class Links {
  List<Data> data;
  int page;
  int pages;

  Links({this.data, this.page, this.pages});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['pages'] = this.pages;
    return data;
  }
}

class Data {
  String link;
  String description;
  Category category;

  Data({this.link, this.description, this.category});

  Data.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}


