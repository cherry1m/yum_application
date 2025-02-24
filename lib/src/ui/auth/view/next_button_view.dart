import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/viewModel/email_login_view_model.dart';
import 'package:yum_application/src/ui/auth/widget/next_button.dart';

class NextButtonView extends StatelessWidget {
  const NextButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return NextButton(
      onTap: context.read<EmailLoginViewModel>().signIn,
    );
  }
}
