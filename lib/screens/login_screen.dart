import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';

import '../provider/auth.dart';
import './profile_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> _login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<Auth>(context, listen: false).login();

      setState(() {
        isLoading = false;
      });

      Flushbar(
        // title: "Hey Ninja",
        message: "Sucessfully Logged In",
        duration: const Duration(seconds: 3),
      )..show(context);

      Navigator.of(context).pushNamed(ProfileScreen.routeName);
    } catch (e) {
      Flushbar(
        // title: "Hey Ninja",
        message: "An Error Occured please try again!",
        duration: const Duration(seconds: 3),
      )..show(context);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  "assets/images/logo_text.png",
                  width: 120,
                ),
                const SizedBox(height: 30),
                Text(
                  "Log in as Shopper or Driver",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  print("Forgot Password");
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            suffixIconConstraints: const BoxConstraints(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 170,
                  height: 35,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      // side: BorderSide(color: Colors.red),
                    ),
                    elevation: 0,
                    onPressed: () {
                      _login(context);
                    },
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator())
                        : const Text(
                            "Log in",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "Dont have an account?",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Sign up to become part of us",
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                ),
                // const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      // side: BorderSide(color: Colors.red),
                    ),
                    borderSide: BorderSide(
                      color: primaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Join Delivast",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset("assets/images/login_bottom_image.png"),
                // const Placeholder(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
