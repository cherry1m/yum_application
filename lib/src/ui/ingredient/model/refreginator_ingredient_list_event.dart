import 'package:equatable/equatable.dart';
import 'package:yum_application/src/data/ingredient/entity/refreginator_ingredient.dart';

sealed class RefreginatorIngredientListEvent extends Equatable {}

final class ToggleIsWarningFilterEvent extends RefreginatorIngredientListEvent {
  @override
  List<Object?> get props => [];
}

final class CreateRefreginatorIngredientEvent
    extends RefreginatorIngredientListEvent {
  final RefreginatorIngredient ingredient;

  CreateRefreginatorIngredientEvent({required this.ingredient});
  @override
  List<Object?> get props => [ingredient];
}

final class UpdateRefreginatorIngredientEvent
    extends RefreginatorIngredientListEvent {
  final RefreginatorIngredient ingredient;
  UpdateRefreginatorIngredientEvent({required this.ingredient});

  @override
  List<Object?> get props => [];
}

final class DeleteRegreginatorIngredientEvent
    extends RefreginatorIngredientListEvent {
  final RefreginatorIngredient ingredient;
  DeleteRegreginatorIngredientEvent({required this.ingredient});

  @override
  List<Object?> get props => [ingredient];
}
