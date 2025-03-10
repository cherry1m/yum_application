import 'package:flutter/material.dart';

/// 자취얌에서 사용하는 회원가입 및 로그인 인증 관련 텍스트 필드입니다.
class LoginTextField extends StatelessWidget {
  // 키보드 타입을 지정합니다. 기본은 null입니다.
  final TextInputType? keyboardType;
  // 필드 너비를 지정합니다. 기본은 350입니다.
  final double width;
  // 컨트롤러를 지정합니다. 기본은 null입니다.
  final TextEditingController? controller;
  // hintlabel을 지정합니다. style은 변경 불가능합니다.
  final String? hintText;
  // obscure 여부를 결정합니다.
  final bool obscureText;
  // validation 관련 함수를 지정합니다.
  final void Function(String)? onChanged;
  const LoginTextField(
      {super.key,
      this.keyboardType,
      this.controller,
      this.hintText,
      this.width = 350,
      this.obscureText = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      obscureText: obscureText,
      controller: controller,
      style: const TextStyle(
          color: Color(0xff1f1e1c), fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        constraints: BoxConstraints.tight(Size(width, 48)),
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
