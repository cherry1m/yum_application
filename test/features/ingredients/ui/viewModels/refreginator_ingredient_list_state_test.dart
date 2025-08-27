import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_state.dart';

void main() {
  group(RefreginatorIngredientListState, () {
    final ingredients = [
      RefreginatorIngredient(
          id: 'uuid1',
          name: 'tomato',
          isFreezed: true,
          category: IngredientCategory.tomato,
          startAt: DateTime(2025, 8, 12),
          endAt: DateTime(2025, 8, 14)),
      RefreginatorIngredient(
          id: 'uuid2',
          name: 'tomato',
          isFreezed: false,
          category: IngredientCategory.tomato,
          startAt: DateTime(2025, 8, 10),
          endAt: DateTime(2025, 8, 30)),
      RefreginatorIngredient(
          id: 'uuid3',
          name: 'tomato',
          isFreezed: true,
          category: IngredientCategory.tomato,
          startAt: DateTime(2025, 8, 12),
          endAt: null),
      RefreginatorIngredient(
          id: 'uuid4',
          name: 'tomato',
          isFreezed: false,
          category: IngredientCategory.tomato,
          startAt: DateTime(2025, 8, 12),
          endAt: DateTime(2025, 8, 13)),
      RefreginatorIngredient(
          id: 'uuid5',
          name: 'tomato',
          isFreezed: true,
          category: IngredientCategory.tomato,
          startAt: DateTime(2025, 8, 12),
          endAt: DateTime(2025, 12, 11)),
    ];

    test('constructor works correctly', () {
      const state = RefreginatorIngredientListState();

      expect(state.ingredients.isEmpty, true);
      expect(state.isWarningFilterOn, false);
      expect(state.status, RefreginatorIngredientListStatus.init);
    });

    test(
        'should returns warning filtered ingredients when isWarningFilterOn field is true',
        () {
      final now = DateTime(2025, 8, 12);
      final state = RefreginatorIngredientListState(
          ingredients: ingredients, isWarningFilterOn: true);

      final filteredItems = state.filteredIngredientsAt(now);
      expect(filteredItems.length, 2);
    });

    test('should return frozen ingredients', () {
      final now = DateTime(2025, 8, 12);

      final state = RefreginatorIngredientListState(ingredients: ingredients);
      final frozenIngredients = state.myFreezedIngredientsAt(now);
      expect(frozenIngredients.length, 3);
    });

    test(
        'should return frozen ingredients when isWarningFilterOn field is true',
        () {
      final now = DateTime(2025, 8, 12);

      final state = RefreginatorIngredientListState(
          ingredients: ingredients, isWarningFilterOn: true);
      final frozenIngredients = state.myFreezedIngredientsAt(now);
      expect(frozenIngredients.length, 1);
    });

    test('should return unFrozen ingredients', () {
      final now = DateTime(2025, 8, 12);

      final state = RefreginatorIngredientListState(ingredients: ingredients);
      final unFrozenIngredients = state.myUnfreezedIngredientsAt(now);
      expect(unFrozenIngredients.length, 2);
    });

    test(
        'should return unFrozen ingredients when isWarningFilterOn field is true',
        () {
      final now = DateTime(2025, 8, 12);

      final state = RefreginatorIngredientListState(
          ingredients: ingredients, isWarningFilterOn: true);
      final unFrozenIngredients = state.myUnfreezedIngredientsAt(now);
      expect(unFrozenIngredients.length, 1);
    });

    test('copyWith method works correctly', () {
      const state = RefreginatorIngredientListState();

      expect(state.ingredients.isEmpty, true);
      expect(state.isWarningFilterOn, false);
      expect(state.status, RefreginatorIngredientListStatus.init);

      final updated = state.copyWith(
          ingredients: ingredients,
          isWarningFilterOn: true,
          status: RefreginatorIngredientListStatus.loading);

      expect(updated.ingredients.length, 5);
      expect(updated.isWarningFilterOn, true);
      expect(updated.status, RefreginatorIngredientListStatus.loading);
    });
  });
}
