import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/features/ingredients/ui/views/my_refreginator_title_view.dart';

void main() {
  group(MyRefreginatorTitleView, () {
    late Widget widget;

    setUp(() {
      widget = const MaterialApp(
        home: Scaffold(body: MyRefreginatorTitleView()),
      );
    });

    testWidgets('should render correctly MyRefreginatorTitleView',
        (tester) async {
      await tester.pumpWidget(widget);
      expect(find.text('마이 냉장고'), findsOneWidget);

      await expectLater(
        find.byType(MyRefreginatorTitleView),
        matchesGoldenFile('goldens/my_refreginator_title_view_default.png'),
      );
    });
  });
}
