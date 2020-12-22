import 'package:delivast/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_input.dart';

class ProfileScreen extends StatelessWidget {
  // final Map<String, dynamic> userData;
  // const ProfileScreen(this.userData);
  static const routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo_text.png",
          width: 100,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: primaryColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              // padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height:20),
                  const CircleAvatar(radius: 35, backgroundColor: Colors.black,),
                  const SizedBox(height:20),
                  Text("Laura Silva", style: Theme.of(context).textTheme.subtitle1,),
                  const SizedBox(height:30),
                  const Divider(),
                  const SizedBox(height:25),
                  const ProfileInput(label:"First Name"),
                  const ProfileInput(label:"Last Name"),
                  const ProfileInput(label:"Email"),
                  const ProfileInput(label:"Password"),
                  const ProfileInput(label:"Phone Number"),
                  const SizedBox(height:25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// FlatButton(
// child: const Text("Logout"),
//                 onPressed: () {
//                   Provider.of<Auth>(context).logout();
//                 },
