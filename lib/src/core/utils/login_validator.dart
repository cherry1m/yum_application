/// 로그인 정보를 validation하는 클래스
extension LoginValidator on String {
  /// 사용자 이메일 validation을 수행합니다.
  ///
  /// 사용자의 이메일 형식은 정규표현식과 같아야합니다.
  String? validateEmail() {
    if (isEmpty) {
      return '이메일을 입력하세요';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(this)) {
      return '잘못된 이메일 형식입니다.';
    }
    return null;
  }

  /// 사용자의 비밀번호 validation을 수행합니다.
  ///
  /// 사용자의 비밀번호는 영대소문자, 숫자, 특수문자를 포함한 10자 이상입니다.
  String? validatePassword() {
    if (isEmpty) {
      return "비밀번호를 입력하세요";
    } else if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$')
        .hasMatch(this)) {
      return "잘못된 비밀번호 형식입니다.";
    }
    return null;
  }
}
