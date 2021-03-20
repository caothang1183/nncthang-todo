import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  static const String ACCESS_TOKEN = "ACCESS_TOKEN";
  static const String LOGIN_TIME_STAMP = "LOGIN_TIME_STAMP";


  Future<void> setAccessToken(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCESS_TOKEN, data);
  }

  Future<String> getAccessToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(ACCESS_TOKEN);
  }

  Future<bool> clearAccessToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(ACCESS_TOKEN);
  }

  Future<bool> setLastLoginTime(int timeStamp) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(LOGIN_TIME_STAMP, timeStamp);
  }

  Future<int> getLastLoginTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(LOGIN_TIME_STAMP);
  }

  Future<bool> clearLastLoginTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(LOGIN_TIME_STAMP);
  }
}
