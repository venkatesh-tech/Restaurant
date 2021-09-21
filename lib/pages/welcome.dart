import 'dart:async';

import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 5000), (){
      Navigator.pushNamed(context, 'signin');
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(backgroundBlendMode image: Dec),
      )
    )
      
    );
  }
}