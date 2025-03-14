import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_model.dart';

class BasicIngredientList {
  static List<BasicIngredient> get ingredients => [
        BasicIngredient(
            name: "밥",
            category: IngredientCategory.rice,
            type: IngredientType.carbohydrate),
        BasicIngredient(
            name: "빵",
            category: IngredientCategory.bread,
            type: IngredientType.carbohydrate),
        BasicIngredient(
            name: "면",
            category: IngredientCategory.noodle,
            type: IngredientType.carbohydrate),
        BasicIngredient(
          name: "양배추",
          category: IngredientCategory.cabbage,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "양파",
          category: IngredientCategory.onion,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "감자",
          category: IngredientCategory.potato,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "토마토",
          category: IngredientCategory.tomato,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "파",
          category: IngredientCategory.green_onion,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "버섯",
          category: IngredientCategory.mushroom,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "마늘",
          category: IngredientCategory.garlic,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "고추",
          category: IngredientCategory.pepper,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "포도",
          category: IngredientCategory.grape,
          type: IngredientType.vegetable,
        ),
        BasicIngredient(
          name: "소고기",
          category: IngredientCategory.beef,
          type: IngredientType.meatsAndEggs,
        ),
        BasicIngredient(
          name: "돼지고기",
          category: IngredientCategory.fork,
          type: IngredientType.meatsAndEggs,
        ),
        BasicIngredient(
          name: "닭고기",
          category: IngredientCategory.chicken_breast,
          type: IngredientType.meatsAndEggs,
        ),
        BasicIngredient(
          name: "가공육",
          category: IngredientCategory.processed_meat,
          type: IngredientType.meatsAndEggs,
        ),
        BasicIngredient(
          name: "계란",
          category: IngredientCategory.egg,
          type: IngredientType.meatsAndEggs,
        ),
        BasicIngredient(
          name: "생선",
          category: IngredientCategory.fish,
          type: IngredientType.fishAndShrimp,
        ),
        BasicIngredient(
          name: "새우",
          category: IngredientCategory.shrimp,
          type: IngredientType.fishAndShrimp,
        ),
        BasicIngredient(
          name: "라면",
          category: IngredientCategory.instance_noodle,
          type: IngredientType.processedFood,
        ),
        BasicIngredient(
          name: "김",
          category: IngredientCategory.seaweed,
          type: IngredientType.processedFood,
        ),
        BasicIngredient(
          name: "두부",
          category: IngredientCategory.topu,
          type: IngredientType.processedFood,
        ),
        BasicIngredient(
          name: "만두",
          category: IngredientCategory.dumpling,
          type: IngredientType.processedFood,
        ),
        BasicIngredient(
          name: "참치캔",
          category: IngredientCategory.canned_tuna,
          type: IngredientType.processedFood,
        ),
        BasicIngredient(
          name: "옥수수캔",
          category: IngredientCategory.canned_goods,
          type: IngredientType.processedFood,
        ),
        BasicIngredient(
          name: "우유",
          category: IngredientCategory.milk,
          type: IngredientType.milkAndNuts,
        ),
        BasicIngredient(
          name: "치즈",
          category: IngredientCategory.cheese,
          type: IngredientType.milkAndNuts,
        ),
        BasicIngredient(
          name: "아이스크림",
          category: IngredientCategory.ice_cream,
          type: IngredientType.milkAndNuts,
        ),
        BasicIngredient(
          name: "견과류",
          category: IngredientCategory.nut,
          type: IngredientType.milkAndNuts,
        ),
        BasicIngredient(
          name: "소주",
          category: IngredientCategory.soju,
          type: IngredientType.drink,
        ),
        BasicIngredient(
          name: "맥주",
          category: IngredientCategory.beer,
          type: IngredientType.drink,
        ),
        BasicIngredient(
          name: "와인",
          category: IngredientCategory.drink,
          type: IngredientType.drink,
        ),
      ];
}
