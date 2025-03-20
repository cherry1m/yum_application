import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/data/ingredient/entity/entity.dart';

void main() {
  group("Ingredient Model Unit Test", () {
    test(
        "기본생성자로 Ingredient Model을 생성하는 경우 기본값으로 시작일은 현재 날짜이고, 종료일은 null이다. isFavorite은 false이다.",
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
    });

    test("copy함수를 실행하면 전달받은 인자만 복사하여 새로운 인스턴스를 반환한다.", () {
      final ingredient = RefreginatorIngredient(
        id: 1,
        name: "egg",
        category: IngredientCategory.egg,
        isFreezed: false,
        startAt: DateTime(2024, 11, 11),
        endAt: DateTime(2024, 11, 12),
      );
      RefreginatorIngredient newIngredient;
      newIngredient = ingredient.copy(
        name: "beef",
      );
      expect(newIngredient.name, "beef");
      expect(newIngredient.category, IngredientCategory.egg);
      expect(newIngredient.isFreezed, false);
      expect(newIngredient.startAt, DateTime(2024, 11, 11));
      expect(newIngredient.endAt, DateTime(2024, 11, 12));

      newIngredient = ingredient.copy(
        category: IngredientCategory.beef,
      );

      expect(newIngredient.name, "egg");
      expect(newIngredient.category, IngredientCategory.beef);
      expect(newIngredient.isFreezed, false);
      expect(newIngredient.startAt, DateTime(2024, 11, 11));
      expect(newIngredient.endAt, DateTime(2024, 11, 12));

      newIngredient = ingredient.copy(
        isFreezed: true,
      );

      expect(newIngredient.name, "egg");
      expect(newIngredient.category, IngredientCategory.egg);
      expect(newIngredient.isFreezed, true);
      expect(newIngredient.startAt, DateTime(2024, 11, 11));
      expect(newIngredient.endAt, DateTime(2024, 11, 12));

      newIngredient = ingredient.copy(
        startAt: DateTime(2024, 11, 12),
      );

      expect(newIngredient.name, "egg");
      expect(newIngredient.category, IngredientCategory.egg);
      expect(newIngredient.isFreezed, false);
      expect(newIngredient.startAt, DateTime(2024, 11, 12));
      expect(newIngredient.endAt, DateTime(2024, 11, 12));

      newIngredient = ingredient.copy(
        endAt: DateTime(2024, 11, 19),
        overrideEndAt: true,
      );

      expect(newIngredient.name, "egg");
      expect(newIngredient.category, IngredientCategory.egg);
      expect(newIngredient.isFreezed, false);
      expect(newIngredient.startAt, DateTime(2024, 11, 11));
      expect(newIngredient.endAt, DateTime(2024, 11, 19));
    });
    group("fromJson() 테스트", () {
      test("json으로부터 엔티티를 반환한다.", () {
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

      test("endAt이 null 이라면 null을 반환한다.", () {
        final json = {
          "id": 1,
          "name": "egg",
          "isFreezed": false,
          "isFavorite": false,
          "category": "egg",
          "startAt": "2024-11-12",
        };
        final ingredient = RefreginatorIngredient.fromJson(json);
        expect(ingredient.id, 1);
        expect(ingredient.name, "egg");
        expect(ingredient.isFreezed, false);
        expect(ingredient.category, IngredientCategory.egg);
        expect(ingredient.startAt, DateTime(2024, 11, 12));
        expect(ingredient.endAt, null);
      });
    });

    group("toJson 테스트", () {
      test("toJson 메소드로 json 직렬화가 가능하다.", () {
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

      test("endAt이 null 이라면 endAt은 null을 반환한다.", () {
        final ingredient = RefreginatorIngredient(
          name: "egg",
          isFreezed: false,
          category: IngredientCategory.egg,
          startAt: DateTime(2024, 11, 12),
        );
        final json = ingredient.toJson();
        expect(json, {
          "id": null,
          "name": "egg",
          "isFreezed": false,
          "category": "egg",
          "startAt": "2024-11-12",
          "endAt": null
        });
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
