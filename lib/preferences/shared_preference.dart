import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  void setLogin(String username) async {
    SharedPreferences getPref = await _pref;
    getPref.setBool('isLogin', true);
    getPref.setString('username', username);
  }

  Future<String> getUsername() async {
    SharedPreferences getPref = await _pref;
    String username = getPref.getString('username') ?? 'notFound';
    return username;
  }

}