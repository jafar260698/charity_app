

class UserType {
  String name;
  String sysName;
  String language;

  UserType({this.name, this.sysName, this.language});

  UserType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sysName = json['sys_name'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sys_name'] = this.sysName;
    data['language'] = this.language;
    return data;
  }
}
