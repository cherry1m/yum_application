import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/refreginator_ingredient_model.dart';

enum SelectType { create, update }

base class SelectedNewRefreginatorIngredient extends Equatable {
  final BasicIngredient? selectedIngredient;
  final int? id;
  final bool isFreezed;
  final String name;
  final DateTime startAt;
  final DateTime? endAt;
  final SelectType type;
  final bool isINF;

  SelectedNewRefreginatorIngredient({
    this.selectedIngredient,
    this.isFreezed = false,
    this.id,
    this.name = "",
    DateTime? startAt,
    DateTime? endAt,
    this.type = SelectType.create,
    this.isINF = false,
  })  : startAt = startAt ?? DateTime.now(),
        endAt = endAt ?? DateTime.now();

  SelectedNewRefreginatorIngredient copyWith({
    int? id,
    BasicIngredient? selectedIngredient,
    bool overrideSelectedIngredient = false,
    bool? isFreezed,
    String? name,
    DateTime? startAt,
    DateTime? endAt,
    bool overrideEndAt = false,
    SelectType? type,
    bool? isINF,
  }) {
    return SelectedNewRefreginatorIngredient(
      id: id ?? this.id,
      selectedIngredient: overrideSelectedIngredient
          ? selectedIngredient
          : (selectedIngredient ?? this.selectedIngredient),
      isFreezed: isFreezed ?? this.isFreezed,
      name: name ?? this.name,
      startAt: startAt ?? this.startAt,
      endAt: overrideEndAt ? endAt : (endAt ?? this.endAt),
      type: type ?? this.type,
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
