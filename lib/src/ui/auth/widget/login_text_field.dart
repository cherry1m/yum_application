import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  const LoginTextField(
      {super.key,
      this.keyboardType,
      this.controller,
      this.hintText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: const TextStyle(
          color: Color(0xff1f1e1c), fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        constraints: BoxConstraints.tight(const Size(350, 48)),
        filled: true,
        fillColor: const Color(0xfff2f2f2),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13.5, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16.0)),
        hintText: hintText,
        hintStyle: theme.textTheme.labelMedium,
      ),
    );
  }
}
