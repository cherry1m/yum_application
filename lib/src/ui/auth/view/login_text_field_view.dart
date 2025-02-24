import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/auth/widget/login_text_field.dart';

class LoginTextFieldView extends StatelessWidget {
  const LoginTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: const Column(
          children: [
            LoginTextField(
              hintText: "이메일을 입력해주세요",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 29,
            ),
            LoginTextField(
              hintText: "비밀번호를 입력해주세요",
              obscureText: true,
            )
          ],
        ));
  }
}
