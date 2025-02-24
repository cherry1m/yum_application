import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/viewModel/email_login_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/login_text_field.dart';

class LoginTextFieldView extends StatelessWidget {
  const LoginTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailLoginViewModel>(builder: (context, provider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginTextField(
            controller: provider.emailController,
            hintText: "이메일을 입력해주세요",
            keyboardType: TextInputType.emailAddress,
            onChanged: provider.validateEmail,
          ),
          Text(
            provider.emailValidLabel,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffFF3700),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          LoginTextField(
            controller: provider.passwordController,
            hintText: "비밀번호를 입력해주세요",
            obscureText: true,
            onChanged: provider.validatePassword,
          ),
          Text(
            provider.passwordValidLabel,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffFF3700),
            ),
          ),
        ],
      );
    });
  }
}
