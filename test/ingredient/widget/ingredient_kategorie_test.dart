import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/widget/ingredient_kategorie.dart';
import 'package:yum_application/src/ui/widget/ingredient_list_tile.dart';

void main() {
  const kategoriTitle = '채소';

  Widget buildTestWidget(List<IngredientListTile> children) {
    return MaterialApp(
      home: Scaffold(
        body: IngredientKategori(
          title: kategoriTitle,
          children: children,
        ),
      ),
    );
  }

  group('Ingredient Kategori 위젯 테스트', () {
    testWidgets('카테고리 제목이 올바르게 렌더링 되는지 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([]));

      expect(find.text(kategoriTitle), findsOneWidget);
    });

    testWidgets('Container에 Border와 Padding이 적용되는지 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([]));

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
      expect(decoration.border?.top.color, Colors.orange);

      expect(container.padding, const EdgeInsets.symmetric(horizontal: 22));
    });

    testWidgets('자식이 0개일 때 렌더링 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([]));

      expect(find.text(kategoriTitle), findsOneWidget);
      expect(find.byType(IngredientListTile), findsNothing);
    });

    testWidgets('자식이 1개일 때 렌더링 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([
        IngredientListTile(
          name: '양파',
          count: 2,
          date: '2025-09-30',
          isExpiring: false,
          onEdit: () {},
          onDelete: () {},
        ),
      ]));

      expect(find.text('양파'), findsOneWidget);
      expect(find.text('2개'), findsOneWidget);
      expect(find.text('2025-09-30'), findsOneWidget);
    });

    testWidgets('자식이 2개일 때 렌더링 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([
        IngredientListTile(
          name: '양파',
          count: 2,
          date: '2025-09-30',
          isExpiring: false,
          onEdit: () {},
          onDelete: () {},
        ),
        IngredientListTile(
          name: '당근',
          count: 3,
          date: '2025-10-02',
          isExpiring: true,
          onEdit: () {},
          onDelete: () {},
        ),
      ]));

      expect(find.text('양파'), findsOneWidget);
      expect(find.text('당근'), findsOneWidget);
      expect(find.byType(IngredientListTile), findsNWidgets(2));
    });
  });

  group('IngredientKategori 골든 테스트', () {
    testWidgets('골든 테스트 - 기본 UI', (tester) async {
      await tester.pumpWidget(buildTestWidget([
        IngredientListTile(
          name: '양파',
          count: 2,
          date: '2025-09-30',
          isExpiring: true,
          onEdit: () {},
          onDelete: () {},
        ),
        IngredientListTile(
          name: '당근',
          count: 5,
          date: '2025-10-30',
          isExpiring: false,
          onEdit: () {},
          onDelete: () {},
        ),
      ]));

      await expectLater(
        find.byType(IngredientKategori),
        matchesGoldenFile('goldens/ingredient_kategori.png'),
      );
    });
  });
}
