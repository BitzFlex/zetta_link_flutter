import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:zetta_link/view/list.dart";
import "package:zetta_link/view/login.dart";


class ViewSplash extends StatefulWidget {
  const ViewSplash({super.key});

  @override
  State<ViewSplash> createState() => _SplashState();
}

class _SplashState extends State<ViewSplash> {
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
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ViewList() ));
      } else
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ViewLogin() ));
      }
    });
  }



  @override
  void initState() {
    // TODO: implement initState

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
