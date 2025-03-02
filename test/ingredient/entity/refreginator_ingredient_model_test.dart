import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/data/ingredient/entity/entity.dart';

void main() {
  group("Ingredient Model Unit Test", () {
    test(
        "기본생성자로 Ingredient Model을 생성하는 경우 기본값으로 시작일과 종료일은 모두 현재날짜이다. isFavorite은 false이다.",
        () {
      final ingredient = RefreginatorIngredient(
          name: "egg", category: IngredientCategory.egg, isFreezed: false);
      final now = DateTime.now();
      final year = now.year;
      final month = now.month;
      final day = now.day;
      expect(ingredient.startAt.year, year);
      expect(ingredient.startAt.month, month);
      expect(ingredient.startAt.day, day);
      expect(ingredient.endAt.year, year);
      expect(ingredient.endAt.month, month);
      expect(ingredient.endAt.day, day);
    });

    test("copy함수를 실행하면 새로운 재료 인스턴스가 갱신된다.", () {
      final ingredient = RefreginatorIngredient(
          name: "egg", category: IngredientCategory.egg, isFreezed: false);
      final newIngredient = ingredient.copy(
          name: "beef",
          category: IngredientCategory.beef,
          isFreezed: true,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 19));
      expect(newIngredient.name, "beef");
      expect(newIngredient.category, IngredientCategory.beef);
      expect(newIngredient.isFreezed, true);
      expect(newIngredient.startAt, DateTime(2024, 11, 12));
      expect(newIngredient.endAt, DateTime(2024, 11, 19));
    });

    test("fromJson() 테스트", () {
      final json = {
        "id": 1,
        "name": "egg",
        "isFreezed": false,
        "isFavorite": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };
      final ingredient = RefreginatorIngredient.fromJson(json);
      expect(ingredient.id, 1);
      expect(ingredient.name, "egg");
      expect(ingredient.isFreezed, false);
      expect(ingredient.category, IngredientCategory.egg);
      expect(ingredient.startAt, DateTime(2024, 11, 12));
      expect(ingredient.endAt, DateTime(2024, 11, 17));
    });

    test("toJson 테스트", () {
      final ingredient = RefreginatorIngredient(
        name: "egg",
        isFreezed: false,
        category: IngredientCategory.egg,
        startAt: DateTime(2024, 11, 12),
        endAt: DateTime(2024, 11, 17),
      );
      final json = ingredient.toJson();
      expect(json, {
        "id": null,
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      });
    });

    test("두 재료가 id를 포함하여 모든 속성이 같다면 동일한 냉장고 재료이다.", () {
      final ingredient1 = RefreginatorIngredient(
          id: 1,
          name: "egg",
          category: IngredientCategory.egg,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 19),
          isFreezed: false);

      final ingredient2 = RefreginatorIngredient(
          id: 1,
          name: "egg",
          category: IngredientCategory.egg,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 19),
          isFreezed: false);

      expect(ingredient1 == ingredient2, true);
    });
  });
}
