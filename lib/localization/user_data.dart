
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Object getUserData(var key) {
    var object;
    _prefs.then((SharedPreferences prefs) {
      object = (prefs.getString(key) ?? 'value(-72)');
    });
    return object;
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('token');
  }

  Future<void> setLang(String lang) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('lang', lang);
  }

  Future<String> getLang() async {
    final SharedPreferences prefs = await _prefs;
    var lang=prefs.getString('lang');
    lang=lang=="uz" ? "kz" : "ru";
    return lang;
  }


  Future<void> setFirstTime(bool isERI) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isFirstTime', isERI);
  }

  Future<bool> isFirstTime() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isFirstTime')??true;
  }

  Future<void> setUsername(String username) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('username', username);
  }

  Future<String> getUsername() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('username');
  }
  Future<void> setEmail(String email) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('email', email);
  }

  Future<String> getEmail() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('email');
  }

  Future<void> setPassword(String password) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('password', password);
  }

  Future<String> getPassword() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('password');
  }

  Future<void> setPhoneNumber(String phoneNumber) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('phone_number', phoneNumber);
  }

  Future<String> getPhoneNumber() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('phone_number');
  }

  Future<void> setUserType(String userType) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('userType', userType);
  }

  Future<String> getUserType() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('userType');
  }

  Future<void> setAvatar(String userType) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('avatar', userType);
  }

  Future<String> getAvatar() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('avatar');
  }

  Future<void> clearData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('token');
    prefs.remove('isFirstTime');
    prefs.remove('username');
    prefs.remove('password');
    prefs.remove('email');
    prefs.remove('phone_number');
    prefs.remove('userType');
  }
}
