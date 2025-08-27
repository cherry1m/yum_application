import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/data/model/favorite_category.dart';

import 'favorite_category_test.mocks.dart';

@GenerateMocks([
  DocumentSnapshot,
])
void main() {
  group(FavoriteCategory, () {
    setUp(() {});

    test('constructor works correctly', () {
      const favoriteCategory = FavoriteCategory(id: 'uuid', category: "grape");
      expect(favoriteCategory.id, 'uuid');
      expect(favoriteCategory.category, 'grape');
    });

    test('fromFirestore deserializes fields correctly', () {
      final mockSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();

      when(mockSnapshot.id).thenReturn('uuid');
      when(mockSnapshot.data()).thenReturn({'category': 'grape'});

      final favorite = FavoriteCategory.fromFirestore(mockSnapshot);

      expect(favorite.id, 'uuid');
      expect(favorite.category, 'grape');
    });

    test('toJson serializes fields correctly', () {
      const favorite = FavoriteCategory(id: 'uuid', category: 'grape');

      final json = favorite.toFirestore();

      expect(json['id'], 'uuid');
      expect(json['category'], 'grape');
    });

    group('FavoriteCategory.copyWith', () {
      const favorite = FavoriteCategory(id: 'uuid', category: 'category');
      test('should update field when value is provided', () {
        final updated = favorite.copyWith(id: 'new uuid', category: 'beef');
        expect(updated.id, 'new uuid');
        expect(updated.category, 'beef');
      });

      test('should keep values existing value when field is not provided', () {
        final updated = favorite.copyWith(category: 'beef');
        expect(updated.id, 'uuid');
        expect(updated.category, 'beef');
      });
    });
  });
}
