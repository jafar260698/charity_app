
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
    return prefs.getString('lang');
  }


  Future<void> setFirstTime(bool isERI) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isFirstTime', isERI);
  }

  Future<bool> isFirstTime() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('isFirstTime')??true;
  }
}
