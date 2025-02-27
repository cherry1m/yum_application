import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/core/utils/login_validator.dart';
import 'package:yum_application/src/ui/auth/view/email_login_view.dart';
import 'package:yum_application/src/ui/auth/viewModel/email_login_view_model.dart';

class EmailLoginPage extends StatelessWidget {
  const EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => LoginValidator(),
        ),
        ChangeNotifierProvider<EmailLoginViewModel>(
          create: (context) =>
              EmailLoginViewModel(validator: context.read<LoginValidator>()),
        ),
      ],
      child: const EmailLoginView(),
    );
  }
}
