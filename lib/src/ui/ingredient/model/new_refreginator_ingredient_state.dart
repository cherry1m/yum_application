import 'package:equatable/equatable.dart';
import 'package:yum_application/src/ui/ingredient/model/model.dart';

final class SelectedNewRefreginatorIngredient extends Equatable {
  final BasicIngredient? selectedIngredient;
  final bool isFreezed;
  final String name;
  final DateTime startAt;
  final DateTime endAt;

  SelectedNewRefreginatorIngredient({
    this.selectedIngredient,
    this.isFreezed = false,
    this.name = "",
    DateTime? startAt,
    DateTime? endAt,
  })  : startAt = startAt ?? DateTime.now(),
        endAt = endAt ?? DateTime.now();

  SelectedNewRefreginatorIngredient copyWith({
    BasicIngredient? selectedIngredient,
    bool overrideSelectedIngredient = false,
    bool? isFreezed,
    String? name,
    DateTime? startAt,
    DateTime? endAt,
  }) {
    return SelectedNewRefreginatorIngredient(
      selectedIngredient: overrideSelectedIngredient
          ? selectedIngredient
          : (selectedIngredient ?? this.selectedIngredient),
      isFreezed: isFreezed ?? this.isFreezed,
      name: name ?? this.name,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
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
