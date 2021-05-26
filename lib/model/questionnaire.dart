

import 'package:charity_app/model/category.dart';

class Questionnaire {
  List<Data> data;
  int page;
  int pages;

  Questionnaire({this.data, this.page, this.pages});

  Questionnaire.fromJson(Map<String, dynamic> json) {
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
  int id;
  String title;
  String age;
  List<String> questions;
  Category category;
  String createdAt;

  Data(
      {this.id,
        this.title,
        this.age,
        this.questions,
        this.category,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    age = json['age'];
    questions = json['questions'].cast<String>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['age'] = this.age;
    data['questions'] = this.questions;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

