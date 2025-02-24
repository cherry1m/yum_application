import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/auth/view/login_text_field_view.dart';
import 'package:yum_application/src/ui/auth/view/logo_view.dart';
import 'package:yum_application/src/ui/auth/view/next_button_view.dart';
import 'package:yum_application/src/ui/auth/view/option_view.dart';

class EmailLoginView extends StatelessWidget {
  const EmailLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginLogo(),
              const SizedBox(
                height: 68,
              ),
              _loginTextFields(),
              const SizedBox(
                height: 39,
              ),
              _options(),
              const SizedBox(
                height: 58,
              ),
              _button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginLogo() =>
      const LogoView(key: Key("email-login-view-logo"), label: "로그인");

  Widget _loginTextFields() => const LoginTextFieldView(
        key: Key("email-login-view-login-text-field-view"),
      );

  Widget _options() => const OptionView(
        key: Key("email-login-view-option-view"),
      );

  Widget _button() => const NextButtonView(
        key: Key("email-login-view-next-button"),
      );
}
