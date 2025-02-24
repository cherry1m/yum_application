import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/core/utils/login_validator.dart';

// null은 올바른 이메일 형식
// 그 외에 이메일을 입력하세요 혹은 잘못된 이메일 형식입니다 가 반환됨.
void main() {
  final validator = LoginValidator();
  group("Login Validator Unit Test", () {
    test("사용자의 이메일 test1234@test.com은 null을 반환한다.", () {
      const email = "test1234@test.com";
      expect(validator.validateEmail(email), null);
    });

    test("사용자의 이메일 test1test.com은 '잘못된 이메일 형식입니다.'를 반환한다.", () {
      const email = "test1test.com";
      expect(validator.validateEmail(email), '잘못된 이메일 형식입니다.');
    });

    test("사용자의 이메일 test1testcom은 '잘못된 이메일 형식입니다.'를 반환한다.", () {
      const email = "test1testcom";
      expect(validator.validateEmail(email), '잘못된 이메일 형식입니다.');
    });

    test("사용자의 이메일 test-1234@test.com은 null을 반환한다.", () {
      const email = "test-1234@test.com";
      expect(validator.validateEmail(email), null);
    });

    test("사용자의 비밀번호 QWfas2312!asd은 null을 반환한다.", () {
      const password = "QWfas2312!asd";
      expect(validator.validatePassword(password), null);
    });

    test(
        "사용자의 비밀번호 qwfas2312!asd은 '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.'을 반환한다.",
        () {
      const password = "qwfas2312!asd";
      expect(validator.validatePassword(password),
          '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.');
    });

    test(
        "사용자의 비밀번호 qwfas!asd은 '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.'을 반환한다.",
        () {
      const password = "qwfas!asd";
      expect(validator.validatePassword(password),
          '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.');
    });

    test(
        "사용자의 비밀번호 qwfasasdasdfasd은 '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.'을 반환한다.",
        () {
      const password = "qwfasasdasdfasd";
      expect(validator.validatePassword(password),
          '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.');
    });

    test("사용자의 비밀번호 aA1@은 '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.'을 반환한다.",
        () {
      const password = "aA1@";
      expect(validator.validatePassword(password),
          '비밀번호는 숫자, 영대소문자, 특수문자를 포함한 10자 이상의 형식입니다.');
    });

    test("사용자의 비밀번호 ''은 '비밀번호를 입력하세요.'을 반환한다.", () {
      const password = "";
      expect(validator.validatePassword(password), '비밀번호를 입력하세요.');
    });
  });
}
