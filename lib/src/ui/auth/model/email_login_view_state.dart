import 'package:equatable/equatable.dart';

final class EmailLoginViewState extends Equatable {
  /// 사용자가 입력한 이메일
  ///
  /// 초기값은 빈 값입니다.
  final String email;

  /// 사용자가 입력한 패스워드
  ///
  /// 초기값은 빈 값입니다.
  final String password;

  /// 사용자가 입력한 이메일 Validation Message
  ///
  /// 초기값은 빈 값입니다.
  final String emailValidLabel;

  /// 사용자가 입력한 비밀번호 Validation Message
  ///
  /// 초기값은 빈 값입니다.
  final String passwordValidLabel;

  const EmailLoginViewState({
    this.email = "",
    this.password = "",
    this.emailValidLabel = "",
    this.passwordValidLabel = "",
  });

  /// 로그인 가능 bool getter
  ///
  /// 사용자의 이메일과 비밀번호가 빈 값이 아니고
  /// Validation Message도 모두 빈값이어야 가능합니다.
  bool get canSignUp =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      emailValidLabel.isEmpty &&
      passwordValidLabel.isEmpty;

  EmailLoginViewState copyWith({
    String? email,
    String? password,
    String? emailValidLabel,
    String? passwordValidLabel,
  }) {
    return EmailLoginViewState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailValidLabel: emailValidLabel ?? this.emailValidLabel,
      passwordValidLabel: passwordValidLabel ?? this.passwordValidLabel,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        emailValidLabel,
        passwordValidLabel,
      ];
}
