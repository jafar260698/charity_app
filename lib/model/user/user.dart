

class User {
  int id;
  String phone;
  String name;
  String email;
  String avatar;
  Language language;

  User(
      {this.id, this.phone, this.name, this.email, this.avatar, this.language});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
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