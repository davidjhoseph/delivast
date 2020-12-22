import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth.dart';
import './login_screen.dart';
import './profile_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      navigate();
    });
  }

  Future<void> navigate() async {
    final isAuth = await Provider.of<Auth>(context, listen: false).isAuth();
    if (isAuth) {
      Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      // appBar: AppBar(centerTitle: true, title: Image.asset("assets/images/logo_text.png", width: 100,), backgroundColor: Colors.transparent, elevation: 0,),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Delivast",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                navigate();
              },
              child: Image.asset(
                "assets/images/logo_text.png",
                width: 100,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
