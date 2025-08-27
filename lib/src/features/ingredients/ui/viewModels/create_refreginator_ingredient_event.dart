import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

// 식재료 생성 이벤트
sealed class CreateRefreginatorIngredientEvent extends Equatable {}

// 식재료 선택 안함 이벤트
final class UnSelectedNewIngredientEvent
    extends CreateRefreginatorIngredientEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// 식재료 선택 이벤트
final class SelectNewIngredientEvent extends CreateRefreginatorIngredientEvent {
  final BasicIngredient selectIngredient;

  SelectNewIngredientEvent({required this.selectIngredient});

  @override
  List<Object?> get props => [selectIngredient];
}

final class UpdateSelectedIngredientName
    extends CreateRefreginatorIngredientEvent {
  final String newName;

  UpdateSelectedIngredientName({required this.newName});
  @override
  List<Object?> get props => [newName];
}

final class UpdateSelectedIngredientStartAt
    extends CreateRefreginatorIngredientEvent {
  final DateTime newStartAt;

  UpdateSelectedIngredientStartAt({required this.newStartAt});
  @override
  List<Object?> get props => [newStartAt];
}

final class UpdateSelectedIngredientEndAt
    extends CreateRefreginatorIngredientEvent {
  final DateTime newEndAt;

  UpdateSelectedIngredientEndAt({required this.newEndAt});

  @override
  List<Object?> get props => [newEndAt];
}

final class ToggleSelectedIngredientIsFreezed
    extends CreateRefreginatorIngredientEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleSelectedIngredientIsINF
    extends CreateRefreginatorIngredientEvent {
  final bool isINF;

  ToggleSelectedIngredientIsINF({required this.isINF});
  @override
  List<Object?> get props => [
        isINF,
      ];
}
