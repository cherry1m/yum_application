import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/core/extensions/login_validator.dart';

// null은 올바른 이메일 형식
// 그 외에 이메일을 입력하세요 혹은 잘못된 이메일 형식입니다 가 반환됨.
void main() {
  group("Login email Validation Unit Test", () {
    test("사용자의 이메일 test1234@test.com은 ''를 반환한다.", () {
      const email = "test1234@test.com";
      expect(email.validateEmail(), "");
    });

    test("사용자의 이메일 test1test.com은 '잘못된 이메일 형식입니다.'를 반환한다.", () {
      const email = "test1test.com";
      expect(email.validateEmail(), '잘못된 이메일 형식입니다.');
    });

    test("사용자의 이메일 test1testcom은 '잘못된 이메일 형식입니다.'를 반환한다.", () {
      const email = "test1testcom";
      expect(email.validateEmail(), '잘못된 이메일 형식입니다.');
    });

    test("사용자의 이메일 test-1234@test.com은 ''을 반환한다.", () {
      const email = "test-1234@test.com";
      expect(email.validateEmail(), '');
    });

    group("Login password Validation Unit Test", () {
      test("사용자의 비밀번호 QWfas2312!asd은 ''을 반환한다.", () {
        const password = "QWfas2312!asd";
        expect(password.validatePassword(), '');
      });

      test("사용자의 비밀번호 qwfas2312!asd은 '잘못된 비밀번호 형식입니다.'을 반환한다.", () {
        const password = "qwfas2312!asd";
        expect(password.validatePassword(), '잘못된 비밀번호 형식입니다.');
      });

      test("사용자의 비밀번호 qwfas!asd은 '잘못된 비밀번호 형식입니다.'을 반환한다.", () {
        const password = "qwfas!asd";
        expect(password.validatePassword(), '잘못된 비밀번호 형식입니다.');
      });

      test("사용자의 비밀번호 qwfasasdasdfasd은 '잘못된 비밀번호 형식입니다.'을 반환한다.", () {
        const password = "qwfasasdasdfasd";
        expect(password.validatePassword(), '잘못된 비밀번호 형식입니다.');
      });

      test("사용자의 비밀번호 aA1@은 '잘못된 비밀번호 형식입니다.'을 반환한다.", () {
        const password = "aA1@";
        expect(password.validatePassword(), '잘못된 비밀번호 형식입니다.');
      });

      test("사용자의 비밀번호 ''은 '비밀번호를 입력하세요.'을 반환한다.", () {
        const password = "";
        expect(password.validatePassword(), '비밀번호를 입력하세요.');
      });
    });

    group("Login nickName Validation Unit Test", () {
      test("사용자의 이메일은 빈칸인 경우 '닉네임을 입력하세요.'가 반환된다.", () {
        const nickName = "";
        expect(nickName.validateNickName(), '닉네임을 입력하세요.');
      });

      test("사용자의 이메일이 공백을 포함하는 경우 '닉네임에 공백은 사용할 수 없습니다.'가 반환된다.", () {
        const nickName = "1234 ";
        expect(nickName.validateNickName(), '닉네임에 공백은 사용할 수 없습니다.');
      });
    });
  });
}
