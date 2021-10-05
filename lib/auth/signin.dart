import 'package:flutter/material.dart';
import 'package:restaurant/values/values.dart';
// stful, stless, stanim
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePath.loginBg), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(top: Sizes.SIZE_120, left: 30),
                    child: Text(
                      'Welcome Dude!',
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    )),
                SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 30, right: 30),
                                child: Column(
                                  children: [
                                    TextField(
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          hintText: 'customer@demo.com',
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(22))),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          hintText: 'password',
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(22))),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        CircleAvatar(
                                            backgroundColor: Colors.blueAccent,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, 'dashboard');
                                                },
                                                icon:
                                                    Icon(Icons.arrow_forward)))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, 'signup');
                                            },
                                            child: Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.underline),
                                              textAlign: TextAlign.left,
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, 'signup');
                                            },
                                            child: Text(
                                              'Forget Password',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.underline),
                                              textAlign: TextAlign.left,
                                            ))
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        ))),
              ],
            )));
  }
}
