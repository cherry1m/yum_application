import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/core/extensions/login_validator.dart';
import 'package:yum_application/src/ui/auth/model/email_login_view_event.dart';
import 'package:yum_application/src/ui/auth/viewModel/email_login_view_model.dart';

void main() {
  late final EmailLoginViewModel viewModel;
  group("Email Login View Model Unit Test", () {
    setUpAll(() {
      viewModel = EmailLoginViewModel();
    });

    test("초기값은 모두 빈 값이다.", () {
      final state = viewModel.state;
      expect(state.email.isEmpty, true);
      expect(state.password.isEmpty, true);
      expect(state.emailValidLabel.isEmpty, true);
      expect(state.passwordValidLabel.isEmpty, true);
      expect(state.canSignUp, false);
    });

    test("ValidationInputEmail을 통해서 현재 이메일에 대한 정보를 수정할 수 있다.", () {
      final event = ValidateInputEmail(email: "test@test.com");

      viewModel.onEvent(event);
      final currState = viewModel.state;
      expect(currState.email, "test@test.com");
      expect(currState.emailValidLabel, "test@test.com".validateEmail());
    });

    test("ValidationInputPassword을 통해서 현재 이메일에 대한 정보를 수정할 수 있다.", () {
      final event = ValidateInputPassword(password: "testpassword");

      viewModel.onEvent(event);
      final currState = viewModel.state;
      expect(currState.password, "testpassword");
      expect(currState.passwordValidLabel, "testpassword".validatePassword());
    });
  });
}
