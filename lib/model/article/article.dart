

import 'package:charity_app/model/category.dart';

class Article {
  List<Data> data;
  int page;
  int pages;

  Article({this.data, this.page, this.pages});

  Article.fromJson(Map<String, dynamic> json) {
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
  String name;
  String title;
  String description;
  String author;
  String authorPosition;
  Null authorPhoto;
  Category category;
  Null image;
  int likes;
  int views;
  bool isLiked;
  bool inBookmarks;
  List<Null> comments;
  int createdAt;

  Data(
      {this.id,
        this.name,
        this.title,
        this.description,
        this.author,
        this.authorPosition,
        this.authorPhoto,
        this.category,
        this.image,
        this.likes,
        this.views,
        this.isLiked,
        this.inBookmarks,
        this.comments,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    author = json['author'];
    authorPosition = json['author_position'];
    authorPhoto = json['author_photo'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    image = json['image'];
    likes = json['likes'];
    views = json['views'];
    isLiked = json['is_liked'];
    inBookmarks = json['in_bookmarks'];
    if (json['comments'] != null) {
      comments = new List<Null>();
      json['comments'].forEach((v) {
        //comments.add(new Null.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['description'] = this.description;
    data['author'] = this.author;
    data['author_position'] = this.authorPosition;
    data['author_photo'] = this.authorPhoto;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['views'] = this.views;
    data['is_liked'] = this.isLiked;
    data['in_bookmarks'] = this.inBookmarks;
    if (this.comments != null) {
     // data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

