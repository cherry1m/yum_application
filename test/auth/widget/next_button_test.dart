import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/auth/widget/next_button.dart';

void main() {
  late final MaterialApp widget;
  group("NextButton 위젯 테스트", () {
    late int count;

    setUp(() {
      count = 0;
      widget = MaterialApp(
        home: NextButton(
          onTap: () {
            count++;
          },
        ),
      );
    });
    testWidgets("NextButton의 onTap은 사용자가 지정한 void Function()을 수행한다.",
        (tester) async {
      await tester.pumpWidget(widget);
      await tester.tap(find.byType(NextButton));
      expect(count, 1);
    });
  });
}
