import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/view/login_text_field_view.dart';
import 'package:yum_application/src/ui/auth/viewModel/email_login_view_model.dart';

void main() {
  late final MaterialApp widget;

  group("LoginTextFieldView UI Test", () {
    setUpAll(() {
      widget = MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => EmailLoginViewModel(),
          child: const Scaffold(body: LoginTextFieldView()),
        ),
      );
    });
    testWidgets("사용자의 초기 Validation 문구는 비어있다.", (tester) async {
      await tester.pumpWidget(widget);
      // expect(find.byKey(const Key("email-login-view-email-textfield")),
      //     findsOneWidget);
      expect(find.bySemanticsLabel(""), findsAtLeast(2));
      expect(find.text("이메일을 입력해주세요"), findsOneWidget);
      expect(find.text("비밀번호를 입력해주세요"), findsOneWidget);
    });

    testWidgets("사용자는 잘못된 이메일 형식을 입력하면 '잘못된 이메일 형식입니다.'가 렌더링된다.",
        (tester) async {
      const invalidEmail = "test@test.c";
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("email-login-view-email-textfield")),
          findsOneWidget);
      final emailField =
          find.byKey(const Key("email-login-view-email-textfield"));
      await tester.enterText(emailField, invalidEmail);
      await tester.pumpAndSettle();

      expect(find.bySemanticsLabel("잘못된 이메일 형식입니다."), findsOneWidget);
    });

    testWidgets("사용자는 잘못된 비밀번호 형식을 입력하면 '잘못된 비밀번호 형식입니다.'가 렌더링된다.",
        (tester) async {
      const invalidEmail = "asdfASDF12";
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("email-login-view-password-textfield")),
          findsOneWidget);
      final emailField =
          find.byKey(const Key("email-login-view-password-textfield"));
      await tester.enterText(emailField, invalidEmail);
      await tester.pumpAndSettle();

      expect(find.bySemanticsLabel("잘못된 비밀번호 형식입니다."), findsOneWidget);
    });
  });
}
