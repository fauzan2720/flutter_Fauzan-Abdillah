import 'package:first_project/model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionLogin {
  Future<AuthModel> init() async {
    final SharedPreferences box = await SharedPreferences.getInstance();
    final String username = box.getString("username") ?? '';
    final String password = box.getString("password") ?? '';
    return AuthModel(username: username, password: password);
  }

  Future<bool> check() async {
    final SharedPreferences box = await SharedPreferences.getInstance();
    final String username = box.getString("username") ?? '';
    if (username.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> save(AuthModel query) async {
    final SharedPreferences box = await SharedPreferences.getInstance();
    box.setString("username", query.username);
    box.setString("password", query.password);
  }

  Future<void> clear() async {
    final SharedPreferences box = await SharedPreferences.getInstance();
    box.clear();
  }
}
