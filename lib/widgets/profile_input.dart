import 'package:flutter/material.dart';

class ProfileInput extends StatelessWidget {
  final String label;
  final TextInputType keyType;
  final bool isPassword;
  final TextEditingController textController;
  const ProfileInput(
      {@required this.label,
      this.keyType = TextInputType.text,
      this.isPassword = false,
      this.textController});
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.subtitle1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextField(
              controller: textController,
              obscureText: isPassword,
              keyboardType: keyType,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Change Password");
                          },
                          child: Text(
                            "Change",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : const SizedBox(),
                suffixIconConstraints: const BoxConstraints(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
