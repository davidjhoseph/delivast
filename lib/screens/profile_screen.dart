import 'package:delivast/models/user.dart';
import 'package:delivast/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_input.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  // final Map<String, dynamic> userData;
  // const ProfileScreen(this.userData);
  static const routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    final user = Provider.of<Auth>(context, listen: false).user;
    if (user != null) {
      initializeData(user);
    }
  }

  void initializeData(User user) {
    firstNameController = TextEditingController(text: user.firstName);
    lastNameController = TextEditingController(text: user.lastName);
    emailController = TextEditingController(text: user.email);
    passwordController = TextEditingController(text: user.password);
    phoneController = TextEditingController(text: user.phone);
  }

  void _logout(BuildContext context) {
    Provider.of<Auth>(context, listen: false).logout();
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final user = Provider.of<Auth>(context).user;

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
      body: user != null
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    // padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(user.image),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${user.firstName} ${user.lastName}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 30),
                        const Divider(),
                        const SizedBox(height: 25),
                        ProfileInput(
                          label: "First Name",
                          textController: firstNameController,
                        ),
                        ProfileInput(
                          label: "Last Name",
                          textController: lastNameController,
                        ),
                        ProfileInput(
                          label: "Email",
                          keyType: TextInputType.emailAddress,
                          textController: emailController,
                        ),
                        ProfileInput(
                          label: "Password",
                          isPassword: true,
                          textController: passwordController,
                        ),
                        ProfileInput(
                          label: "Phone Number",
                          keyType: TextInputType.phone,
                          textController: phoneController,
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 170,
                          child: RaisedButton(
                            elevation: 0,
                            onPressed: () {},
                            child: const Text(
                              "Save changes",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Divider(),
                        GestureDetector(
                          onTap: () {
                            _logout(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/logout_icon.png",
                                  width: 25,
                                ),
                                const SizedBox(width: 60),
                                const Text(
                                  "Log out",
                                  style: TextStyle(
                                      color: Color(0xFFE65540),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
