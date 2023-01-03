import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  final String isLogin = 'IsLogin';

  setLogin(bool flag) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(isLogin, flag);
  }

  getLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var loginStatus = pref.getBool(isLogin);
    return loginStatus ?? false;
  }

  clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
