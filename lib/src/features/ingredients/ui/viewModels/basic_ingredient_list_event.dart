import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';

sealed class BasicIngredientListEvent extends Equatable {}

final class FavoriteIngredientCreateRequest extends BasicIngredientListEvent {
  final IngredientCategory category;

  FavoriteIngredientCreateRequest({required this.category});

  @override
  List<Object?> get props => [category];
}

final class FavoriteIngredientDeleteRequest extends BasicIngredientListEvent {
  final IngredientCategory category;

  FavoriteIngredientDeleteRequest({required this.category});

  @override
  List<Object?> get props => [category];
}
