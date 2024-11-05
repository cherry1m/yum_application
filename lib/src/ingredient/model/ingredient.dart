import 'package:yum_application/src/ingredient/widget/ingredient_image.dart';

class Ingredient {
  final String name;
  bool isFreezed;
  final IngredientCategory category;
  bool isFavorite;

  Ingredient({
    required this.name,
    required this.category,
    required this.isFreezed,
    this.isFavorite = false,
  });

  /// 재료 이미지 getter
  IngredientImage get image {
    return IngredientImage(isFreezed: isFreezed, path: category.imagePath);
  }

  void updateIsFavorite() {
    isFavorite = !isFavorite;
  }
}

// 재료 속성 enum
enum IngredientCategory {
  beef,
  beer,
  bread,
  broccoli,
  cabbage,
  canned_goods,
  canned_tuna,
  cheese,
  chicken_breast,
  drink,
  dumpling,
  egg,
  fish,
  fork,
  garlic,
  grape,
  green_onion,
  ice_cream,
  instance_noodle,
  milk,
  mushroom,
  noodle,
  nut,
  onion,
  pepper,
  potato,
  processed_meat,
  rice,
  seaweed,
  shrimp,
  soju,
  tomato,
  topu,
  ;

  String get imagePath {
    return "assets/images/$name.png";
  }
}
