import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/auth.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Auth(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: themeData(context),
        // home: SplashScreen(),
        routes: {
          SplashScreen.routeName: (ctx) => SplashScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
