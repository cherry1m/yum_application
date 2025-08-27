import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';

enum BasicIngredientListStatus { loading, done, error }

class BasicIngredientListState extends Equatable {
  final List<BasicIngredient> ingredients;
  final List<IngredientCategory> favorites;
  final BasicIngredientListStatus status;

  const BasicIngredientListState(
      {required this.ingredients,
      required this.status,
      this.favorites = const []});

  /// 종류별 기본 식재료
  ///
  ///
  List<BasicIngredient> getBasicIngredientBy(IngredientType type) {
    return ingredients.where((ingredient) => ingredient.type == type).toList();
  }

  /// 사용자 즐겨찾기 식재료
  ///
  ///
  List<BasicIngredient> getFavorites() {
    return ingredients
        .where((ingredient) => favorites.contains(ingredient.category))
        .toList();
  }

  bool isFavorite(BasicIngredient ingredient) {
    return favorites.contains(ingredient.category);
  }

  BasicIngredientListState copyWith({
    List<BasicIngredient>? ingredients,
    BasicIngredientListStatus? status,
    List<IngredientCategory>? favorites,
  }) {
    return BasicIngredientListState(
        ingredients: ingredients ?? this.ingredients,
        status: status ?? this.status,
        favorites: favorites ?? this.favorites);
  }

  @override
  List<Object?> get props => [ingredients, status];
}
