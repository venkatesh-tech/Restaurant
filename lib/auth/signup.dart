import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant/pages/dashboard.dart';
import 'package:restaurant/values/values.dart';
import 'package:restaurant/api/httpException.dart';
// import 'package:restaurant/auth/auth.dart';

class SignUpPage extends StatefulWidget {
  // const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> _authData = {
    "name": "",
    "email": "",
    "mobile": "",
    "ccode": "",
    "imei": "",
    // 9c1cfe6955491609
    "password": ""
  };

  TextEditingController _passwordController = new TextEditingController();

  Future _submit() async {
    if (!_formKey.currentState!.validate()) {
      // invalid data for registration
      return;
    }
    _formKey.currentState!.save();

    try {
      // await Provider.of<Auth>(context, listen: false)
      //     .signUp(_authData['mobile'], _authData['password'])
      //     .then(() {
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => RestaurantHomePage()));
      //   Navigator.of(context).pop();
      // });
    } on HttpException catch (errObj) {
      var errorMessage = 'Authentication Failed';
      if (errObj.toString().contains('MOBILE_EXISTS')) {
        errorMessage = 'Mobile Number Already Exists!';
        _showErrorDialog(errorMessage);
      } else if (errObj.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'Weak Password!';
        _showErrorDialog(errorMessage);
      }
    } catch (errObj) {
      var errorMessage = 'Something went wrong';
      _showErrorDialog(errorMessage);
    }
  }

  // error function
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'OOPs!!!',
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.TEXT_SIZE_18),
        ),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Okay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagePath.registerBg), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Signup Here!',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'First Name',
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Last Name',
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'customer@demo.com',
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'signin');
                                      },
                                      icon: Icon(Icons.arrow_forward)))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'signup');
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 22,
                                        decoration: TextDecoration.underline,
                                        color: Colors.black),
                                    textAlign: TextAlign.left,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// dynamic data - statefulwidget (user specific)
// static data - statelesswidget (generic for all users)
// Widget build() - handles UI