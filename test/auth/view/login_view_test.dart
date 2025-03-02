import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/core/utils/global_variable.dart';
import 'package:yum_application/src/ui/auth/page/login_page.dart';
import 'package:yum_application/src/ui/auth/view/resister_view.dart';

import 'login_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NavigatorObserver>()])
void main() {
  late final MaterialApp widget;

  group("Login View UI 테스트", () {
    final observer = MockNavigatorObserver();
    setUp(() {
      widget = MaterialApp(
        home: const LoginPage(),
        navigatorKey: GlobalVariable.naviagatorState,
        navigatorObservers: [observer],
      );
    });

    testWidgets("이메일 로그인 UI가 잘 렌더링 된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("login-view-logo-view")), findsOneWidget);
      expect(find.byKey(const Key("login-view-login-button-view")),
          findsOneWidget);
      expect(find.byKey(const Key("login-view-resister-text-button")),
          findsOneWidget);
    });

    testWidgets("사용자는 이메일 로그인 버튼을 통해서 ResisterView로 이동할 수 있다.", (tester) async {
      await tester.pumpWidget(widget);
      await tester
          .tap(find.byKey(const Key("login-view-resister-text-button")));
      await tester.pumpAndSettle();
      expect(find.byType(ResisterView), findsOneWidget);
    });

    testWidgets("사용자는 이메일을 입력하기 이전에는 validlabel이 이메일 비밀번호 모두 ''이다.",
        (tester) async {
      await tester.pumpWidget(widget);
      expect(find.bySemanticsLabel(""), findsAtLeast(2));
    });
  });
}
