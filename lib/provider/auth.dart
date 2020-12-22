import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class Auth with ChangeNotifier {
  User _user;
  User get user {
    return _user;
  }

  Future<void> login() async {
    http.Response response;

    try {
      response = await http.get("https://randomuser.me/api");
      print(response);
    } catch (e) {
      print(e);
      return;
    }

    final convertedResponse = jsonDecode(response.body);
    final realData = convertedResponse["results"][0];
    final pref = await SharedPreferences.getInstance();
    final userData = jsonEncode(realData);
    pref.setString('userData', userData);
    _user = User.fromJson(userData);
    // Scaffold.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Login Successful"),
    //     duration: Duration(seconds: 3),
    //   ),
    // );
    print(_user);
  }

  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey("userData")) {
      pref.clear();
      return;
    }
    return;
  }

  Future<bool> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    final contains = pref.containsKey("userData");

    if(contains){
      _user = User.fromJson(pref.get("userData"));
    }

    return contains;
  }

}
