import 'dart:async';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 5000), () {
      Navigator.pushNamed(context, 'signin');
    });

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 320,
                ),
                Text('Welcome to \n Restaurant',
                    style: TextStyle(color: Colors.black, fontSize: 36)),
                SizedBox(
                  height: 60,
                ),
                Text(
                    'Here you can get all type of food...!!!! \n Do not miss it',
                    style: TextStyle(color: Colors.black, fontSize: 24)),
                // Spacer(),
                Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signin');
                        },
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 36,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.left,
                        )))
              ],
            ))));
  }
}
