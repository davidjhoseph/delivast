import 'package:flutter/material.dart';

class ProfileInput extends StatelessWidget {
  final String label;
  final TextInputType keyType;
  const ProfileInput({
    @required this.label,
    this.keyType = TextInputType.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.subtitle1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextField(
              keyboardType: keyType,
            ),
          )
        ],
      ),
    );
  }
}
