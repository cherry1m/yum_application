import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';

sealed class UpdateRefreginatorIngredientEvent extends Equatable {}

final class IngredientChangeType extends UpdateRefreginatorIngredientEvent {
  final IngredientCategory category;

  IngredientChangeType({
    required this.category,
  });

  @override
  List<Object?> get props => [category];
}

final class IngredientToggleIsFreezed
    extends UpdateRefreginatorIngredientEvent {
  final bool isFreezed;

  IngredientToggleIsFreezed({required this.isFreezed});

  @override
  List<Object?> get props => [isFreezed];
}

final class IngredientChangeName extends UpdateRefreginatorIngredientEvent {
  final String name;

  IngredientChangeName({required this.name});

  @override
  List<Object?> get props => [name];
}

final class IngredientChangeStartAt extends UpdateRefreginatorIngredientEvent {
  final DateTime startAt;

  IngredientChangeStartAt({required this.startAt});

  @override
  List<Object?> get props => [startAt];
}

final class IngredientChangeEndAt extends UpdateRefreginatorIngredientEvent {
  final DateTime? endAt;

  IngredientChangeEndAt({required this.endAt});

  @override
  List<Object?> get props => [endAt];
}
