import 'package:flutter/material.dart';
import 'package:yum_application/src/data/ingredient/entity/ingredient_category.dart';
import 'package:yum_application/src/data/ingredient/entity/basic_ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';

import '../basic_ingredient_model.dart';

List<BasicIngredient> ingredients = [
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

class BasicIngredientViewModel extends ChangeNotifier {
  final IngredientRepository ingredientRepository;
  BasicIngredientViewModel({required this.ingredientRepository}) {
    fetchData();
  }

  BasicIngredientState _state = LoadingState(
    ingredients: ingredients,
  );

  BasicIngredientState get state => _state;

  void onEvent(BasicIngredientListEvent event) {
    switch (event) {
      case ToggleIsFavorite():
        toggleIsFavorite(event.category);
    }
    notifyListeners();
  }

  /// 즐겨찾기 재료 FETCH 메소드
  ///
  /// [BasicIngredientViewModel]이 생성되는 단계에서
  /// 서버로부터 사용자의 즐겨찾기 데이터를 가져옵니다.
  void fetchData() async {
    try {
      final result = await ingredientRepository.getMyFavoriteIngredient();

      _state = LoadedState(
          ingredients: _state.ingredients.map((i) {
            if (result.contains(i.category)) {
              return i.copy(isFavorite: true);
            } else {
              return i;
            }
          }).toList(),
          categories: result);
      notifyListeners();
    } catch (e) {
      _state = ErrorState(
        ingredients: _state.ingredients,
      );
      notifyListeners();
    }
  }

  /// 초기 재료의 즐겨찾기 토글 함수
  ///
  /// 이 함수를 통해서 해당 재료의 즐겨찾기를 활성화 또는 비활성화 할 수 있습니다.
  void toggleIsFavorite(IngredientCategory category) async {
    final currState = (_state as LoadedState);
    if (currState.categories.contains(category)) {
      deleteFavoriteIngredient(category);
      _state = currState.copyWith(
        ingredients: currState.ingredients.map((i) {
          if (i.category == category) {
            return i.copy(isFavorite: false);
          } else {
            return i;
          }
        }).toList(),
        categories: currState.categories.where((c) => c != category).toList(),
      );
    } else {
      createNewFavoriteIngredient(category);
      _state = currState.copyWith(
          ingredients: currState.ingredients.map((i) {
            if (i.category.name == category.name) {
              return i.copy(isFavorite: true);
            } else {
              return i;
            }
          }).toList(),
          categories: [
            ...currState.categories,
            category,
          ]);
    }
  }

  /// 즐겨찾기 재료 생성 메소드
  ///
  /// 이 메소드를 통해서 사용자는 새로운 즐겨찾기 재료를 추가할 수 있습니다.
  /// 새롭게 추가된 즐겨찾기 재료는 서버에 저장됩니다.
  void createNewFavoriteIngredient(IngredientCategory category) {
    try {
      ingredientRepository.createNewFavoriteIngredient(category);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 즐겨찾기 재료 삭제 메소드
  ///
  /// 이 메소드를 통해서 사용자는 기존의 즐겨찾기에 추가된 재료를 삭제할 수 있습니다.
  /// 삭제된 즐겨찾기 재료는 서버 DB에서 삭제됩니다.
  void deleteFavoriteIngredient(IngredientCategory category) {
    try {
      ingredientRepository.deleteFavoriteIngredient(category);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
