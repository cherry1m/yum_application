import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/viewModel/email_login_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/next_button.dart';

/// 사용자가 입력한 정보를 통해서 로그인을 시도할 수 있는
/// 로그인 버튼입니다.
/// [NextButton]을 통해 구현되었습니다.
class NextButtonView extends StatelessWidget {
  const NextButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return NextButton(
      onTap: context.read<EmailLoginViewModel>().signIn,
    );
  }
}
