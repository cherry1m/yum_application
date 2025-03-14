import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/core/utils/global_variable.dart';
import 'package:yum_application/src/core/extensions/login_validator.dart';
import 'package:yum_application/src/ui/main_page.dart';

class EmailLoginViewModel extends ChangeNotifier {
  // 이메일
  String email = "";
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  // 비밀번호
  String password = "";
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  // 이메일 검증 결과 메시지
  String _emailValidLabel = "";

  String get emailValidLabel => _emailValidLabel;

  // 비밀번호 검증 결과 메시지
  String _passwordValidLabel = "";

  String get passwordValidLabel => _passwordValidLabel;

  /// 사용자의 이메일을 검증합니다.
  ///
  /// 이메일 형식에 맞지 않으면 검증 메시지가 반환됩니다.
  /// 이메일이 비어있는 경우에는 예외로 메시지가 반환되지 않습니다.
  void validateEmail(String email) {
    final validMessage = email.validateEmail() ?? "";
    _emailValidLabel = validMessage;
    notifyListeners();
  }

  /// 사용자의 비밀번호를 검증합니다.
  ///
  /// 비밀번호 형식에 맞지 않으면 검증 메시지가 반환됩니다.
  /// 비밀빈호가 비어있는 경우에는 예외로 메시지가 반환되지 않습니다.
  void validatePassword(String password) {
    final validMessage = password.validatePassword() ?? "";
    _passwordValidLabel = validMessage;
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
    notifyListeners();
  }
}
