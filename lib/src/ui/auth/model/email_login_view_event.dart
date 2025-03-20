import 'package:equatable/equatable.dart';

sealed class EmailLoginViewEvent extends Equatable {}

/// 이메일 검증 이벤트
final class ValidateInputEmail extends EmailLoginViewEvent {
  final String email;

  ValidateInputEmail({required this.email});
  @override
  List<Object?> get props => [
        email,
      ];
}

/// 비밀번호 검증 이벤트
final class ValidateInputPassword extends EmailLoginViewEvent {
  final String password;

  ValidateInputPassword({required this.password});
  @override
  List<Object?> get props => [password];
}

/// 로그인 이벤트
final class SignIn extends EmailLoginViewEvent {
  @override
  List<Object?> get props => [];
}
