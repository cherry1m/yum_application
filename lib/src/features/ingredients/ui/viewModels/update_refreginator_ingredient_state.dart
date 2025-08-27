import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

class UpdateRefreginatorIngredientState extends Equatable {
  final IngredientCategory category;
  final String? id;
  final bool isFreezed;
  final String name;
  final DateTime startAt;
  final DateTime? endAt;

  const UpdateRefreginatorIngredientState({
    required this.category,
    required this.id,
    required this.isFreezed,
    required this.name,
    required this.startAt,
    required this.endAt,
  });

  bool get isINF {
    return endAt == null;
  }

  factory UpdateRefreginatorIngredientState.fromRefreginatorIngredient(
      RefreginatorIngredient ingredient) {
    return UpdateRefreginatorIngredientState(
      id: ingredient.id,
      category: ingredient.category,
      isFreezed: ingredient.isFreezed,
      name: ingredient.name,
      startAt: ingredient.startAt,
      endAt: ingredient.endAt,
    );
  }

  UpdateRefreginatorIngredientState copyWith({
    String? id,
    IngredientCategory? category,
    bool? isFreezed,
    String? name,
    DateTime? startAt,
    DateTime? endAt,
    bool overrideEndAt = false,
  }) {
    return UpdateRefreginatorIngredientState(
      id: id ?? this.id,
      category: category ?? this.category,
      isFreezed: isFreezed ?? this.isFreezed,
      name: name ?? this.name,
      startAt: startAt ?? this.startAt,
      endAt: overrideEndAt ? endAt : (endAt ?? this.endAt),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        name,
        isFreezed,
        startAt,
        endAt,
      ];
}
