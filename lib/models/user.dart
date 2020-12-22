import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  User({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phone,
    @required this.image,
    @required this.password,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String image;

  factory User.fromJson(dynamic d) {
    final data = json.decode(d as String);
    // print(data);
    return User(
        firstName: data['name']['first'] as String,
        lastName: data['name']['last'] as String,
        email: data['email'] as String,
        phone: data['phone'] as String,
        image: data['picture']["medium"] as String,
        password: data['login']['password'] as String);
  }
}
