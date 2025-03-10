import 'package:equatable/equatable.dart';
import 'package:yum_application/src/data/ingredient/entity/ingredient_category.dart';

sealed class BasicIngredientListEvent extends Equatable {}

final class ToggleIsFavorite extends BasicIngredientListEvent {
  final IngredientCategory category;

  ToggleIsFavorite({required this.category});
  @override
  List<Object?> get props => [category];
}
