import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route/auth/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
static const String routename = "Splash" ;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, LoginScreen.routename);
    });
    return Scaffold(
      body: Image.asset("assets/images/SplashScreen.png",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,),
    );
  }
}
