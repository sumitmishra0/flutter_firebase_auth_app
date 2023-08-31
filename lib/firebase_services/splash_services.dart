import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/auth/login_screen.dart';

class SplashServices {

  void isLogin(BuildContext context) {
    Timer( const Duration(seconds: 3),() => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }
}