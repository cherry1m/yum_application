import 'package:equatable/equatable.dart';
import 'package:yum_application/src/ui/ingredient/model/model.dart';

enum SelectType { create, update }

final class SelectedNewRefreginatorIngredient extends Equatable {
  final BasicIngredient? selectedIngredient;
  final bool isFreezed;
  final String name;
  final DateTime startAt;
  final DateTime endAt;
  final SelectType type;
  final bool isINF;

  SelectedNewRefreginatorIngredient({
    this.selectedIngredient,
    this.isFreezed = false,
    this.name = "",
    DateTime? startAt,
    DateTime? endAt,
    this.type = SelectType.create,
    this.isINF = false,
  })  : startAt = startAt ?? DateTime.now(),
        endAt = endAt ?? DateTime.now();

  SelectedNewRefreginatorIngredient copyWith({
    BasicIngredient? selectedIngredient,
    bool overrideSelectedIngredient = false,
    bool? isFreezed,
    String? name,
    DateTime? startAt,
    DateTime? endAt,
    SelectType? type,
    bool? isINF,
  }) {
    return SelectedNewRefreginatorIngredient(
      selectedIngredient: overrideSelectedIngredient
          ? selectedIngredient
          : (selectedIngredient ?? this.selectedIngredient),
      isFreezed: isFreezed ?? this.isFreezed,
      name: name ?? this.name,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      type: type ?? this.type,
      isINF: isINF ?? this.isINF,
    );
  }

  RefreginatorIngredient toNewIngredient() {
    return RefreginatorIngredient(
        name: name,
        category: selectedIngredient!.category,
        isFreezed: isFreezed,
        startAt: startAt,
        endAt: endAt);
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
