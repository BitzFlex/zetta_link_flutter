import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:zetta_link/view/content_list_view.dart";
import "package:zetta_link/view/login_view.dart";


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashState();
}

class _SplashState extends State<SplashView> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool("isLogin") ?? false;
    print("isLogin : $isLogin");
    // return isLogin;
    return false;
  }


  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ContentListView() ));
      } else
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ContentListView() ));
      }
    });
  }



  @override
  void initState() {

    print("init state");
    Timer(const Duration(seconds: 2), 
          () {
             print("Timer Proc");      
             moveScreen();
          }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("ZettaLink Splash", style: TextStyle(fontSize: 60)),
        Text("Zetta Things Link", style: TextStyle(fontSize: 30)),
      ])),
    );
  } // build
}
