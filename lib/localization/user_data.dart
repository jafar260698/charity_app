
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
  Future<void> setPinfl(String pinfl) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('pinfl', pinfl);
  }

  Future<String> getPinfl() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('pinfl');
  }

  Future<void> setSelfEmployAccess(bool access) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('self_employ_access', access);
  }

  Future<String> getSelfEmployAccess() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('self_employ_access');
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
    return prefs.getString('lang');
  }

  Future<void> setTheme(String theme) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('view.theme', theme);
  }

  Future<String> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('view.theme');
  }

  Future<void> isFirstTime(bool isERI) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isFirstTime', isERI);
  }

  Future<bool> getIsFirstTime() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isFirstTime');
  }

  Future<void> saveNIN(String nin) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('nin', nin);
  }

  Future<String> getNIN() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('nin');
  }

  Future<void> saveAuth(int auth) async {
    /*
    1 - physic
    2 - legal
    3 - entrepreneur
    4 - selfemployment
     */
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('auth', auth);
  }

  Future<int> getAuth() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('auth')??0;
  }

  Future<void> setLanguageSelected(bool value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('languageSelected', value);
  }

  Future<bool> getLanguageSelected() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('languageSelected')??false;
  }

  Future<String> getFullName() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('fio');
  }

  Future<String> getTin() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('tin');
  }

  Future<String> getUniqueID() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('uniqueID');
  }

  Future<int> getNS10() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('ns10')??0;
  }

  Future<int> getNS11() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt('ns11')??0;
  }

  Future<String> getAddress() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('address');
  }
}
