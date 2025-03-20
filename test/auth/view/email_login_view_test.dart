import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/ui/auth/page/email_login_page.dart';

@GenerateNiceMocks([MockSpec<NavigatorObserver>()])
void main() {
  late MaterialApp widget;

  group("Login View UI 테스트", () {
    setUp(() {
      widget = const MaterialApp(
        home: EmailLoginPage(),
      );
    });

    testWidgets("이메일 로그인 UI가 잘 렌더링 된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("email-login-view-logo")), findsOneWidget);
      expect(find.byKey(const Key("email-login-view-login-text-field-view")),
          findsOneWidget);
      expect(find.byKey(const Key("email-login-view-option-view")),
          findsOneWidget);
      expect(find.byKey(const Key("email-login-view-next-button")),
          findsOneWidget);
    });

    testWidgets("초기 UI에서는 hintLabel이 렌더링되고 Validation Message는 모두 빈값이다.",
        (tester) async {
      await tester.pumpWidget(widget);

      expect(find.bySemanticsLabel("이메일을 입력해주세요"), findsOneWidget);
      expect(find.bySemanticsLabel("비밀번호를 입력해주세요"), findsOneWidget);
    });
  });
}
