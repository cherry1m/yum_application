import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/auth/model/email_login_view_state.dart';

void main() {
  const model = EmailLoginViewState();
  group("Email Login View State Unit Test", () {
    test("초기값은 모두 빈값이다.", () {
      expect(model.email.isEmpty, true);
      expect(model.password.isEmpty, true);
      expect(model.emailValidLabel.isEmpty, true);
      expect(model.passwordValidLabel.isEmpty, true);
    });

    test("초기에는 로그인이 가능하지 않다.", () {
      expect(model.canSignUp, false);
    });

    test("copyWith()함수로 이메일을 변경할 수 있다.", () {
      final newModel = model.copyWith(email: "new email");
      expect(newModel.email, "new email");
      expect(newModel.password.isEmpty, true);
      expect(newModel.emailValidLabel.isEmpty, true);
      expect(newModel.passwordValidLabel.isEmpty, true);
    });

    test("copyWith()함수로 비밀번호를 변경할 수 있다.", () {
      final newModel = model.copyWith(password: "new password");
      expect(newModel.email.isEmpty, true);
      expect(newModel.password, "new password");
      expect(newModel.emailValidLabel.isEmpty, true);
      expect(newModel.passwordValidLabel.isEmpty, true);
    });

    test("copyWith()함수로 이메일 Validation Label을 변경할 수 있다.", () {
      final newModel = model.copyWith(emailValidLabel: "invalid");
      expect(newModel.email.isEmpty, true);
      expect(newModel.password.isEmpty, true);
      expect(newModel.emailValidLabel, "invalid");
      expect(newModel.passwordValidLabel.isEmpty, true);
    });

    test("copyWith()함수로 비밀번호 Validation Label을 변경할 수 있다.", () {
      final newModel = model.copyWith(passwordValidLabel: "invalid");
      expect(newModel.email.isEmpty, true);
      expect(newModel.password.isEmpty, true);
      expect(newModel.emailValidLabel.isEmpty, true);
      expect(newModel.passwordValidLabel, "invalid");
    });
  });
}
