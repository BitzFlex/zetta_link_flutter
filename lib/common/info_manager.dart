import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';


class InfoManager
{
  InfoManager._privateConstruct();
  static final InfoManager _instance = InfoManager._privateConstruct();


  Future setLogin(bool l) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', l);
  }

  factory InfoManager() {
    return _instance;
  }
}

