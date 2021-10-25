import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/api/api.dart';
// import 'package:restaurant/values/values.dart';
// import 'package:restaurant/api/httpException.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  var baseUrl = Api.BASE_URL;
  var secret = Api.SECRET_KEY;

  late String _userId;
  late String _userMobile;
  late String _userEmail;
  late String _token;
  late DateTime _expiryDate;
  late Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    } else {
      return 'invalid token';
    }
  }

  String get userEmail {
    return _userEmail;
  }

  String get userMobile {
    return _userMobile;
  }

  String get userId {
    return _userId;
  }

  // Logout action that flushes all the data
  Future<void> logout() async {
    _userId = '';
    _userMobile = '';
    _userEmail = '';
    _token = '';
    // _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
    }

    notifyListeners();
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  void _autologout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }

    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> signUp(String mobile, String password) {
    return Authentication(mobile, password);
  }

  Future<void> Authentication(String mobile, String password) async {
    try {
      final url = Api.REGISTER_API;

      final response = await http.post(Uri.parse(url),
          body: json.encode({
            "name": 'Jithu Jithu',
            "email": 'jithu078@gmail.com',
            "mobile": mobile,
            "ccode": "+91",
            "imei": "9c1cfe6955491780",
            "password": password
          }));

      final responseData = jsonDecode(response.body);
      print(responseData);
    } catch (e) {
      throw e;
    }
  }
}
