import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yum_application/src/core/utils/global_variable.dart';
import 'package:yum_application/src/ui/auth/model/sign_up.dart';
import 'package:yum_application/src/ui/auth/page/email_login_page.dart';

class ResisterCompleteViewModel extends ChangeNotifier {
  final SignUp signUp;

  ResisterCompleteViewModel({required this.signUp});

  bool _isAgreeFirst = false;
  bool get isAgreeFirst => _isAgreeFirst;

  bool _isAgreeSecond = false;
  bool get isAgreeSecond => _isAgreeSecond;

  bool _isAgreeLast = false;
  bool get isAgreeLast => _isAgreeLast;

  bool get isAllAgree => _isAgreeFirst && _isAgreeSecond && _isAgreeLast;

  // void allAgree(bool value) {

  // }

  void allAgree(bool? value) {
    if (isAllAgree) {
      _isAgreeFirst = false;
      _isAgreeSecond = false;
      _isAgreeLast = false;
      notifyListeners();
      return;
    }
    _isAgreeFirst = true;
    _isAgreeSecond = true;
    _isAgreeLast = true;
    notifyListeners();
  }

  void toggleFirstAgree(bool? value) {
    _isAgreeFirst = !_isAgreeFirst;
    notifyListeners();
  }

  void toggleSecondAgree(bool? value) {
    _isAgreeSecond = !_isAgreeSecond;
    notifyListeners();
  }

  void toggleLastAgree(bool? value) {
    _isAgreeLast = !_isAgreeLast;
    notifyListeners();
  }

  void resiter() {
    if (!_isAgreeFirst || !_isAgreeSecond) {
      return;
    }

    SchedulerBinding.instance.addPersistentFrameCallback((_) {
      final context = GlobalVariable.naviagatorState.currentContext!;
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
    notifyListeners();
  }
}
