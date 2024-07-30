import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsServices {
  SharedPrefsServices._();

  static final SharedPrefsServices instance = SharedPrefsServices._();

  factory SharedPrefsServices() {
    return instance;
  }

  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setLoginStatus(bool isLoggedIn) async {
    await _preferences?.setBool('isLoggedIn', isLoggedIn);
  }

  bool getLoginStatus() {
    return _preferences?.getBool('isLoggedIn') ?? false;
  }

  Future<void> setUserEmail(String email) async {
    await _preferences?.setString('userEmail', email);
  }

  String? getUserEmail() {
    return _preferences?.getString('userEmail');
  }

  Future<void> setUserName(String name) async {
    await _preferences?.setString('userName', name);
  }

  String? getUserName() {
    return _preferences?.getString('userName');
  }

  Future<void> clearPreferences() async {
    await _preferences?.clear();
  }
}
