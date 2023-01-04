import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  final String isLogin = 'IsLogin';
  final String authToken = 'Token';

  setLogin(bool flag) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(isLogin, flag);
  }

  getLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var loginStatus = pref.getBool(isLogin);
    return loginStatus ?? false;
  }

  setToken(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(authToken, token);
  }

  getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString(authToken);
    return token ?? '';
  }

  clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
