import 'package:equatable/equatable.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_model.dart';

// 식재료 생성 이벤트
sealed class NewRefreginatorIngredientEvent extends Equatable {}

// 식재료 선택 안함 이벤트
final class UnSelectedNewIngredientEvent
    extends NewRefreginatorIngredientEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// 식재료 선택 이벤트
final class SelectNewIngredientEvent extends NewRefreginatorIngredientEvent {
  final BasicIngredient selectIngredient;

  SelectNewIngredientEvent({required this.selectIngredient});

  @override
  List<Object?> get props => [selectIngredient];
}

final class UpdateSelectedIngredientName
    extends NewRefreginatorIngredientEvent {
  final String newName;

  UpdateSelectedIngredientName({required this.newName});
  @override
  List<Object?> get props => [newName];
}

final class UpdateSelectedIngredientStartAt
    extends NewRefreginatorIngredientEvent {
  final DateTime newStartAt;

  UpdateSelectedIngredientStartAt({required this.newStartAt});
  @override
  List<Object?> get props => [newStartAt];
}

final class UpdateSelectedIngredientEndAt
    extends NewRefreginatorIngredientEvent {
  final DateTime newEndAt;

  UpdateSelectedIngredientEndAt({required this.newEndAt});

  @override
  List<Object?> get props => [newEndAt];
}

final class ToggleSelectedIngredientIsFreezed
    extends NewRefreginatorIngredientEvent {
  @override
  List<Object?> get props => [];
}

final class MoveToUpdatePrevIngredient extends NewRefreginatorIngredientEvent {
  final RefreginatorIngredient prevIngredient;

  MoveToUpdatePrevIngredient({required this.prevIngredient});
  @override
  List<Object?> get props => [
        prevIngredient,
      ];
}

final class ToggleSelectedIngredientIsINF
    extends NewRefreginatorIngredientEvent {
  final bool isINF;

  ToggleSelectedIngredientIsINF({required this.isINF});
  @override
  List<Object?> get props => [
        isINF,
      ];
}
