import 'package:shared_preferences/shared_preferences.dart';


class LoginManager
{
  const LoginManager();

  Future setLogin(bool l) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', l);
  }

}

