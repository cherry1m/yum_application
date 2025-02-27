import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/viewModel/email_login_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/login_text_field.dart';

/// 로그인 UI에서 사용자의 이메일과 비밀번호를 입력하는 필드입니다.
///
/// 위의 필드에서는 이메일을
/// 아래의 필드에서는 비밀번호를 입력할 수 있습니다.
class LoginTextFieldView extends StatelessWidget {
  const LoginTextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailLoginViewModel>(builder: (context, provider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이메일
          LoginTextField(
            controller: provider.emailController,
            hintText: "이메일을 입력해주세요",
            keyboardType: TextInputType.emailAddress,
            onChanged: provider.validateEmail,
          ),
          // 이메일 Validation 결과 텍스트
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

          // 비밀번호
          LoginTextField(
            controller: provider.passwordController,
            hintText: "비밀번호를 입력해주세요",
            obscureText: true,
            onChanged: provider.validatePassword,
          ),

          // 비밀번호 Validation 결과 텍스트
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
