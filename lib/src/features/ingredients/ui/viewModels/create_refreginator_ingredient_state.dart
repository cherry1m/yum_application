import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

class CreateRefreginatorIngredientState extends Equatable {
  final BasicIngredient? selectedIngredient;
  final String? id;
  final bool isFreezed;
  final String name;
  final DateTime startAt;
  final DateTime? endAt;

  final bool isINF;

  CreateRefreginatorIngredientState({
    this.selectedIngredient,
    this.isFreezed = false,
    this.id,
    this.name = "",
    DateTime? startAt,
    DateTime? endAt,
    this.isINF = false,
  })  : startAt = startAt ?? DateTime.now(),
        endAt = endAt ?? DateTime.now();

  bool get enabled {
    if (selectedIngredient == null) return true;
    return false;
  }

  CreateRefreginatorIngredientState copyWith({
    String? id,
    BasicIngredient? selectedIngredient,
    bool overrideSelectedIngredient = false,
    bool? isFreezed,
    String? name,
    DateTime? startAt,
    DateTime? endAt,
    bool overrideEndAt = false,
    bool? isINF,
  }) {
    return CreateRefreginatorIngredientState(
      id: id ?? this.id,
      selectedIngredient: overrideSelectedIngredient
          ? selectedIngredient
          : (selectedIngredient ?? this.selectedIngredient),
      isFreezed: isFreezed ?? this.isFreezed,
      name: name ?? this.name,
      startAt: startAt ?? this.startAt,
      endAt: overrideEndAt ? endAt : (endAt ?? this.endAt),
      isINF: isINF ?? this.isINF,
    );
  }

  RefreginatorIngredient toNewIngredient() {
    return RefreginatorIngredient(
        id: id,
        name: name,
        category: selectedIngredient!.category,
        isFreezed: isFreezed,
        startAt: startAt,
        endAt: isINF ? null : endAt);
  }

  @override
  List<Object?> get props => [
        selectedIngredient,
        isFreezed,
        name,
        startAt,
        endAt,
      ];
}
