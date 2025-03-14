import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_model.dart';

void main() {
  group("Ingredient Category Unit Test", () {
    test("imagePath는 이름을 통해서 이미지 경로를 반환할 수 있다.", () {
      const newCategory = IngredientCategory.egg;
      expect(newCategory.imagePath, "assets/images/egg.png");
    });

    test("재료의 이름으로 fromString() 생성자를 사용할 수 있다.", () {
      final newCategory = IngredientCategory.fromString("beef");
      expect(newCategory, IngredientCategory.beef);
    });

    test("재료를 fromJson()으로 Json으로 생성할 수 있다.", () {
      final json = {"category": "egg"};
      final newCategory = IngredientCategory.fromJson(json);
      expect(newCategory, IngredientCategory.egg);
    });

    test("재료를 toJson()으로 Json으로 바꿀 수 있다.", () {
      const newCategory = IngredientCategory.egg;
      final json = newCategory.toJson();
      expect(json["category"], "egg");
    });
  });
}
