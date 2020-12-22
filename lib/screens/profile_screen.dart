import 'package:delivast/provider/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/profile_input.dart';

class ProfileScreen extends StatelessWidget {
  // final Map<String, dynamic> userData;
  // const ProfileScreen(this.userData);
  TextEditingController firstNameController =
      TextEditingController(text: "Laura");
  TextEditingController lastNameController =
      TextEditingController(text: "Silva");
  TextEditingController emailController =
      TextEditingController(text: "laurasilva@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "mandyyyy");
  TextEditingController phoneController =
      TextEditingController(text: "044-841-9275");
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
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Laura Silva",
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
                    onTap: (){
                      Provider.of<Auth>(context).logout();
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
      ),
    );
  }
}

