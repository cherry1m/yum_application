/// 사용자의 회원가입을 위한 요청 DTO 모델입니다.
class SignUp {
  String email;

  String nickName;

  String password;

  SignUp({
    this.email = "",
    this.nickName = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "nickName": nickName,
        "password": password,
      };
}
