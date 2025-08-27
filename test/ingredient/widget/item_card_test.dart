import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/widget/item_card.dart';

void main() {
  testWidgets('ItemCard 위젯이 올바르게 렌더링 되는지', (WidgetTester tester) async {
    const name = '양파';
    const count = 2;
    const date = '2025-09-30';

    var editTapped = false;
    var deleteTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ItemCard(
            name: name,
            count: count,
            date: date,
            isExpiring: true,
            onEdit: () => editTapped = true,
            onDelete: () => deleteTapped = true,
          ),
        ),
      ),
    );

    // 이름, 알림, 개수, 기한 확인
    expect(find.text(name), findsOneWidget);
    expect(find.text('기간 임박'), findsOneWidget);
    expect(find.text('$count개'), findsOneWidget);
    expect(find.text(date), findsOneWidget);

    // 아이콘 버튼 확인
    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);

    // 버튼 탭 동작 확인
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pump();
    expect(editTapped, isTrue);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();
    expect(deleteTapped, isTrue);
  });
}
