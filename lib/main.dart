import 'package:flutter/material.dart';
// included in almost all the pages - Material Theme UI
import 'package:r/auth/signin.dart';
import 'package:r/auth/signup.dart';

void main() {
  runApp(MaterialApp(
    home: SignInPage(),
    debugShowCheckedModeBanner: false,
    routes: {
      'signin': (context) => SignInPage(),
      'signup': (context) => SignUpPage(),
      // 'dashboard': (context) => DashBoardPage(),
    },
  ));
}

// BuildContext context