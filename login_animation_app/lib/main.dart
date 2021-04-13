import 'package:flutter/material.dart';
import 'package:login_animation_app/utils/splash_screen_rotative.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SplashScreenRotative(colorBackGround: Colors.black12,subCenter: "Welcome",
        timeTween: 3,timeDuration: 5000, imageCenter: Image.asset(
        "assets/images/logo_rotative.png", width: 100, height: 100,
      ),onFinish: (closed) {
        closed ? print("Animation Closed") : print("");
      },
      ),
    );
  }
}

