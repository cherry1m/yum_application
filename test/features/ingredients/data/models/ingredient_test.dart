import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/data/model/ingredient.dart';

import 'ingredient_test.mocks.dart';

@GenerateMocks([QueryDocumentSnapshot])
void main() {
  group(Ingredient, () {
    test('constructor works correctly', () {
      final ingredient = Ingredient(
          id: 'uuid',
          name: 'Apple',
          category: 'grape',
          isFreezed: false,
          startAt: DateTime(2023, 1, 10),
          endAt: DateTime(2023, 1, 17));

      expect(ingredient.id, 'uuid');
      expect(ingredient.name, 'Apple');
      expect(ingredient.category, 'grape');
      expect(ingredient.isFreezed, false);
      expect(ingredient.startAt, DateTime(2023, 1, 10));
      expect(ingredient.endAt, DateTime(2023, 1, 17));
    });

    test('endAt field can be null', () {
      final ingredient = Ingredient(
        id: 'uuid',
        name: 'Apple',
        category: 'grape',
        isFreezed: false,
        startAt: DateTime(2023, 1, 10),
        endAt: null,
      );

      expect(ingredient.id, 'uuid');
      expect(ingredient.name, 'Apple');
      expect(ingredient.category, 'grape');
      expect(ingredient.isFreezed, false);
      expect(ingredient.startAt, DateTime(2023, 1, 10));
      expect(ingredient.endAt, null);
    });

    test('toJson serializes fields correctly', () {
      final ingredient = Ingredient(
        id: 'uuid',
        name: 'Apple',
        category: 'grape',
        isFreezed: false,
        startAt: DateTime(2023, 1, 1),
        endAt: DateTime(2023, 1, 10),
      );

      final json = ingredient.toJson();

      expect(json['id'], 'uuid');
      expect(json['name'], 'Apple');
      expect(json['category'], 'grape');
      expect(json['isFreezed'], false);
      expect(
          json['startAt'], '2023-01-01'); // toyyyyMMdd() 가 yyyyMMdd 형식 반환한다고 가정
      expect(json['endAt'], '2023-01-10');
    });

    test('fromFirestore deserializes fields correctly', () {
      final timestampStart = Timestamp.fromDate(DateTime(2023, 1, 1));
      final timestampEnd = Timestamp.fromDate(DateTime(2023, 1, 10));

      final mockSnapshot = MockQueryDocumentSnapshot<Map<String, dynamic>>();
      when(mockSnapshot.id).thenReturn('uuid');
      when(mockSnapshot.data()).thenReturn({
        'name': 'Apple',
        'category': 'grape',
        'isFreezed': false,
        'startAt': timestampStart,
        'endAt': timestampEnd,
      });

      final ingredient = Ingredient.fromFirestore(mockSnapshot);

      expect(ingredient.id, 'uuid');
      expect(ingredient.name, 'Apple');
      expect(ingredient.category, 'grape');
      expect(ingredient.isFreezed, false);
      expect(ingredient.startAt, timestampStart.toDate());
      expect(ingredient.endAt, timestampEnd.toDate());
    });
  });

  group('Ingredient.copyWith', () {
    final baseDate = DateTime(2025, 1, 1);
    final ingredient = Ingredient(
      id: '1',
      name: 'Tomato',
      isFreezed: false,
      category: 'Vegetable',
      startAt: baseDate,
      endAt: DateTime(2025, 1, 10),
    );

    test('should keep existing values when field is not provided', () {
      final updated = ingredient.copyWith(name: 'Potato');

      expect(updated.name, 'Potato');
      expect(updated.id, ingredient.id); // 그대로 유지
      expect(updated.endAt, ingredient.endAt); // 그대로 유지
    });

    test('should update nullable field to null', () {
      final updated = ingredient.copyWith(endAt: null);

      expect(updated.endAt, isNull);
    });

    test('should update nullable field', () {
      final newDate = DateTime(2025, 2, 1);
      final updated = ingredient.copyWith(endAt: newDate);

      expect(updated.endAt, newDate);
    });

    test('should keep endAt field value when not provided any value', () {
      final updated = ingredient.copyWith();

      expect(updated.endAt, ingredient.endAt);
    });
  });
}
