import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/auth/view/email_login_view.dart';

void main() {
  late final MaterialApp widget;

  group("Login View UI 테스트", () {
    setUp(() {
      widget = const MaterialApp(
        home: EmailLoginView(),
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
  });
}
