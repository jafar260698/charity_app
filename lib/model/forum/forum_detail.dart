

class ForumDetail {
  List<Data> data;
  int page;
  int pages;

  ForumDetail({this.data, this.page, this.pages});

  ForumDetail.fromJson(Map<String, dynamic> json) {
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
  String description;
  Language language;
  User user;
  int createdAt;

  Data(
      {this.id,
        this.title,
        this.description,
        this.language,
        this.user,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Language {
  String name;
  String sysName;

  Language({this.name, this.sysName});

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sysName = json['sys_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sys_name'] = this.sysName;
    return data;
  }
}

class User {
  int id;
  String phone;
  String name;
  String email;
  String avatar;

  User({this.id, this.phone, this.name, this.email, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    return data;
  }
}