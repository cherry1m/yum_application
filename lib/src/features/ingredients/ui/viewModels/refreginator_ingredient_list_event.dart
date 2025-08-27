import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

sealed class RefreginatorIngredientListEvent extends Equatable {}

final class IngredientsLoad extends RefreginatorIngredientListEvent {
  @override
  List<Object?> get props => [];
}

final class IngredientCreateReqeust extends RefreginatorIngredientListEvent {
  final RefreginatorIngredient ingredient;

  IngredientCreateReqeust({required this.ingredient});
  @override
  List<Object?> get props => [ingredient];
}

final class IngredientDeleteRequest extends RefreginatorIngredientListEvent {
  final String id;
  IngredientDeleteRequest({required this.id});

  @override
  List<Object?> get props => [id];
}

final class IngredientUpdateRequest extends RefreginatorIngredientListEvent {
  final RefreginatorIngredient ingredient;
  IngredientUpdateRequest({required this.ingredient});

  @override
  List<Object?> get props => [ingredient];
}

final class RefreginatorWarningFilterToggled
    extends RefreginatorIngredientListEvent {
  final bool isOn;

  RefreginatorWarningFilterToggled({required this.isOn});

  @override
  List<Object?> get props => [isOn];
}
