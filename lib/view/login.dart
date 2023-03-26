import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zetta_link/view/list.dart';
import 'package:zetta_link/common/login_manager.dart';


class ViewLogin extends StatelessWidget {
  const ViewLogin({super.key});

  Future setLogin(bool l) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', l);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(title: const Text('Login')),
              backgroundColor: Colors.white,
              body: Center(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: MediaQuery.of(context).size.width * 0.85,                        
                          child:
                                  Column(

                                    children: [
                                                  ElevatedButton(
                                                      onPressed: () {

                                                        LoginManager().setLogin(true).then((value) {
                                                          print('Login Pressed');
                                                          Navigator.of(context).pushReplacement( 
                                                            MaterialPageRoute(builder: (context) => ViewList() )
                                                          );
                                                        });

                                                        // setLogin(true).then((value) {
                                                        //   print('Login Pressed');
                                                        //   Navigator.of(context).pushReplacement( 
                                                        //     MaterialPageRoute(builder: (context) => ViewList() )
                                                        //   );
                                                        // });


                                                      }, 
                                                      child: const Text('Login')
                                                    ),
                                                  ElevatedButton(
                                                      onPressed: () {}, 
                                                      child: const Text('Loout')
                                                    ),

                                    ],
                                  )

                                
                        )
                    )
           );
  }
}

