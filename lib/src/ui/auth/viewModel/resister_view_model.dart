import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/core/extensions/login_validator.dart';
import 'package:yum_application/src/core/utils/global_variable.dart';
import 'package:yum_application/src/ui/auth/model/sign_up.dart';
import 'package:yum_application/src/ui/auth/page/resister_complete_page.dart';

class ResisterViewModel extends ChangeNotifier {
  // 이메일
  String _email = "";

  bool isEmailAvail = false;

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  String _emailValidLabel = "";

  String get emailValidLabel => _emailValidLabel;

  // 닉네임
  String _nickName = "";

  final TextEditingController _nickNameController = TextEditingController();

  TextEditingController get nickNameController => _nickNameController;

  String _nickNameValidLabel = "";

  String get nickNameValidLabel => _nickNameValidLabel;

  // 비밀번호
  String _password = "";

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  String _passwordValidLabel = "";

  String get passwordValidLabel => _passwordValidLabel;
  // 비밀번호 확인

  String _passwordAgain = "";

  final TextEditingController _passwordAgainController =
      TextEditingController();

  TextEditingController get passwordAgainController => _passwordAgainController;

  String _passwordAgainValidLabel = "";

  String get passwordAgainValidLabel => _passwordAgainValidLabel;

  void validEmail(String email) {
    _email = email;
    _emailValidLabel = _email.validateEmail() ?? "";
    notifyListeners();
  }

  void validNickName(String nickName) {
    _nickName = nickName;
    _nickNameValidLabel = _nickName.validateNickName() ?? "";
    notifyListeners();
  }

  void validPassword(String password) {
    _password = password;
    _passwordValidLabel = _password.validatePassword() ?? "";
    notifyListeners();
  }

  void validPasswordAgain(String passwordAgain) {
    _passwordAgain = passwordAgain;
    _passwordAgainValidLabel =
        _passwordAgain.validatePasswordAgain(_password) ?? "";
    notifyListeners();
  }

  void checkUserEmailAvailable() {
    isEmailAvail = true;
    notifyListeners();
  }

  void moveToNext() {
    // validation을 수행하지 못한경우
    if (_email.isEmpty) {
      return;
    } else if (_nickName.isEmpty) {
      return;
    } else if (_password.isEmpty) {
      return;
    } else if (_passwordAgain.isEmpty) {
      return;
    }
    // validation은 통과했지만, 공백인 경우
    if (_emailValidLabel.isNotEmpty) {
      return;
    } else if (_nickNameValidLabel.isNotEmpty) {
      return;
    } else if (_passwordValidLabel.isNotEmpty) {
      return;
    } else if (_passwordAgainValidLabel.isNotEmpty) {
      return;
    }
    final SignUp signUp = SignUp(
      email: _email,
      nickName: _nickName,
      password: _password,
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final context = GlobalVariable.naviagatorState.currentContext!;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResisterCompletePage(
                signUp: signUp,
              )));
    });
    // notifyListeners();
  }
}
