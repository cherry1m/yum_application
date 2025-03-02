import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/auth/view/login_text_field_view.dart';
import 'package:yum_application/src/ui/auth/view/logo_view.dart';
import 'package:yum_application/src/ui/auth/view/next_button_view.dart';
import 'package:yum_application/src/ui/auth/view/option_view.dart';

/// [EmailLoginView]는 사용자가 자체 이메일을 통해 로그인을 진행하는 UI입니다.
///
/// 로그인 로고, 이메일, 비밀번호 입력필드, 아이디 찾기, 비밀번호 찾기,
/// 로그인을 시도할 수 있는 "다음" 버튼으로 구성됩니다.
class EmailLoginView extends StatelessWidget {
  const EmailLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 로그인 로고
                _loginLogo(),
                const SizedBox(
                  height: 68,
                ),

                // 사용자 계정 정보 입력 필드
                _loginTextFields(),
                const SizedBox(
                  height: 23,
                ),

                // 아이디 찾기, 비밀번호 찾기
                _options(),
                const SizedBox(
                  height: 74,
                ),

                // 로그인 버튼
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 로그인 UI의 로그인 로고 필드입니다.
  ///
  /// [LogoView]에서 자세하게 정의합니다.
  Widget _loginLogo() =>
      const LogoView(key: Key("email-login-view-logo"), label: "로그인");

  /// 사용자 계정 입력 텍스트 필드
  ///
  /// 사용자의 이메일과 계정을 입력하는 필드입니다.
  /// [LoginTextFieldView]에서 자세하게 정의합니다.
  Widget _loginTextFields() => const LoginTextFieldView(
        key: Key("email-login-view-login-text-field-view"),
      );

  /// 사용자 아이디 찾기 및 비밀번호 찾기
  ///
  /// 사용자는 해당 필드를 통해서 아이디 혹은 비밀번호 찾기 UI로 이동할 수 있습니다.
  /// 자세한 정의는 [OptionView]에서 정의합니다.
  Widget _options() => const OptionView(
        key: Key("email-login-view-option-view"),
      );

  /// 로그인 시도 버튼
  ///
  /// 사용자의 계정 정보를 통해서 로그인 Api를 요청합니다.
  /// [NextButtonView]에서 자세하게 정의합니다.
  Widget _button() => const NextButtonView(
        key: Key("email-login-view-next-button"),
      );
}
