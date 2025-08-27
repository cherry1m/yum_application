import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/features/ingredients/data/model/ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

void main() {
  group(RefreginatorIngredient, () {
    final ingredientModel = Ingredient(
      id: 'uuid',
      name: 'Cabbage',
      category: 'cabbage',
      isFreezed: false,
      startAt: DateTime(2023, 7, 1),
      endAt: DateTime(2023, 7, 15),
    );

    test('fromResponse creates correct IngredientEntity', () {
      final entity = RefreginatorIngredient.fromResponse(ingredientModel);

      expect(entity.id, 'uuid');
      expect(entity.name, 'Cabbage');
      expect(entity.category.name, 'cabbage');
      expect(entity.isFreezed, false);
      expect(entity.startAt, DateTime(2023, 7, 1));
      expect(entity.endAt, DateTime(2023, 7, 15));
    });

    test('toRequest converts IngredientEntity back to Ingredient', () {
      final entity = RefreginatorIngredient.fromResponse(ingredientModel);
      final model = entity.toRequest();

      expect(model.name, entity.name);
      expect(model.category, entity.category.name);
      expect(model.isFreezed, entity.isFreezed);
      expect(model.startAt, entity.startAt);
      expect(model.endAt, entity.endAt);
    });

    test('startAtKDateFormat returns formatted date string', () {
      final entity = RefreginatorIngredient.fromResponse(ingredientModel);
      expect(entity.startAtKDateFormat, '2023-07-01');
    });

    test('endAtKDateFormat returns formatted date string or empty if null', () {
      final entityWithEndAt =
          RefreginatorIngredient.fromResponse(ingredientModel);
      expect(entityWithEndAt.endAtKDateFormat, '2023-07-15');

      final ingredientNoEndAt = Ingredient(
        id: 'uuid',
        name: 'Lettuce',
        category: 'cabbage',
        isFreezed: false,
        startAt: DateTime(2023, 7, 10),
        endAt: null,
      );
      final entityNoEndAt =
          RefreginatorIngredient.fromResponse(ingredientNoEndAt);
      expect(entityNoEndAt.endAtKDateFormat, '');
    });

    test('equatable supports value equality', () {
      final entity1 = RefreginatorIngredient.fromResponse(ingredientModel);
      final entity2 = RefreginatorIngredient.fromResponse(ingredientModel);

      expect(entity1, equals(entity2));
    });

    test('isWarning should be true when ingredient 3days ago', () {
      final entity = RefreginatorIngredient(
          id: 'uuid',
          name: 'Apple',
          category: IngredientCategory.grape,
          isFreezed: false,
          startAt: DateTime(2025, 8, 11),
          endAt: DateTime(2025, 8, 20));

      expect(entity.isWarning(DateTime(2025, 8, 16)), false);
      expect(entity.isWarning(DateTime(2025, 8, 17)), true);
      expect(entity.isWarning(DateTime(2025, 8, 18)), true);
      expect(entity.isWarning(DateTime(2025, 8, 19)), true);
      expect(entity.isWarning(DateTime(2025, 8, 20)), true);
    });
  });
}
