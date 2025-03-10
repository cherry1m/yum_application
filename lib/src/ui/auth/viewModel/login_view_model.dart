import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/ui/app/page/app_page.dart';
import 'package:yum_application/src/core/utils/global_variable.dart';
import 'package:yum_application/src/ui/auth/page/email_login_page.dart';
import 'package:yum_application/src/ui/auth/page/resister_page.dart';

enum LoginType { google, apple, kakao, email }

class LoginViewModel extends ChangeNotifier {
  /// 임시 로그인 화면
  ///
  ///
  /// 임시 로그인 액션으로 바로 사용자 UI로 이동합니다.
  void signIn(LoginType type) {
    switch (type) {
      case LoginType.google:
      case LoginType.apple:
      case LoginType.kakao:
        moveTo(const AppPage());

      case LoginType.email:
        moveTo(const EmailLoginPage());
    }
    notifyListeners();
  }

  void moveToSignUp() {
    moveTo(const ResisterPage());
    notifyListeners();
  }

  void moveTo(Widget page) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final context = GlobalVariable.naviagatorState.currentContext!;

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
    });
  }
}
