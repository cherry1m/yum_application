import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/data/model/refreginator_ingredient_model.dart';

sealed class BasicIngredientState extends Equatable {
  final List<BasicIngredient> ingredients;

  const BasicIngredientState({required this.ingredients});

  /// [IngredientType]을 통해 각 카테고리 별 기본 식자재 리스트를
  /// 반환하는 메소드
  List<BasicIngredient> getBasicIngredientBy(IngredientType type) {
    return ingredients.where((ingredient) => ingredient.type == type).toList();
  }
}

final class LoadingState extends BasicIngredientState {
  const LoadingState({required super.ingredients});

  @override
  List<Object?> get props => [];
}

final class ErrorState extends BasicIngredientState {
  const ErrorState({required super.ingredients});

  @override
  List<Object?> get props => [];
}

final class LoadedState extends BasicIngredientState {
  final List<IngredientCategory> categories;
  const LoadedState({
    required super.ingredients,
    required this.categories,
  });

  /// 전체 식재료 중 즐겨찾기에 포함된 재료를 반환하는 getter
  ///
  /// 이 메소드를 통해서 isFavorite == true 인 기본 식재료를 반환합니다.
  List<BasicIngredient> get favorites =>
      ingredients.where((ingredient) => ingredient.isFavorite).toList();

  LoadedState copyWith({
    List<BasicIngredient>? ingredients,
    List<IngredientCategory>? categories,
  }) {
    return LoadedState(
        ingredients: ingredients ?? this.ingredients,
        categories: categories ?? this.categories);
  }

  @override
  List<Object?> get props => [
        ingredients,
        categories,
      ];
}
