import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> login() async {
    final response = await http.get("https://randomuser.me/api");
    final convertedResponse = jsonDecode(response.body);
    final realData = convertedResponse["results"][0];
     final pref = await SharedPreferences.getInstance();
    final userData = jsonEncode(realData);
    pref.setString('userData', userData);
    notifyListeners();
    // Scaffold.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Login Successful"),
    //     duration: Duration(seconds: 3),
    //   ),
    // );
    print(userData);
  }
  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    if(pref.containsKey("userData")){
      pref.clear();
      notifyListeners();
      return;
    }
    return;
  }
  Future<bool> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    return pref.containsKey("userData");
  }
}
