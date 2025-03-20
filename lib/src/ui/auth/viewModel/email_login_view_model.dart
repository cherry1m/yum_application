import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/core/utils/global_variable.dart';
import 'package:yum_application/src/core/extensions/login_validator.dart';
import 'package:yum_application/src/ui/auth/model/email_login_view_event.dart';
import 'package:yum_application/src/ui/auth/model/email_login_view_state.dart';
import 'package:yum_application/src/ui/main_page.dart';

class EmailLoginViewModel extends ChangeNotifier {
  // // 이메일
  // String email = "";
  // final TextEditingController _emailController = TextEditingController();
  // TextEditingController get emailController => _emailController;

  // // 비밀번호
  // String password = "";
  // final TextEditingController _passwordController = TextEditingController();
  // TextEditingController get passwordController => _passwordController;

  EmailLoginViewState _state = const EmailLoginViewState();

  EmailLoginViewState get state => _state;

  void onEvent(EmailLoginViewEvent event) {
    switch (event) {
      case ValidateInputEmail():
        final email = event.email;
        _state = _state.copyWith(
            email: email, emailValidLabel: email.validateEmail());
      case ValidateInputPassword():
        final password = event.password;
        _state = _state.copyWith(
            password: password,
            passwordValidLabel: password.validatePassword());

      case SignIn():
        signIn();
    }

    notifyListeners();
  }

  /// 사용자 로그인 함수
  ///
  /// 로그인을 시도하면 서버로부터 로그인 JWT 정보를 Local Storage에 저장합니다.
  ///
  /// 현재는 단순 이동만 구현됩니다.
  void signIn() {
    /// 단순 이동
    /// 추후에 삭제되고 로그인 API로 마이그레이션 예정
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final context = GlobalVariable.naviagatorState.currentContext!;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainPage()));
    });
  }
}
