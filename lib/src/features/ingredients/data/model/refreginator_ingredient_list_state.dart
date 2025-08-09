import 'package:equatable/equatable.dart';
import 'package:yum_application/src/core/extensions/refreginator_is_warning_extension.dart';
import 'package:yum_application/src/features/ingredients/data/model/refreginator_ingredient_model.dart';

// 냉장고 식재료 뷰 State
abstract base class RefreginatorListState extends Equatable {}

// 로딩 상태
final class LoadingState extends RefreginatorListState {
  @override
  List<Object?> get props => [];
}

// 에러 상태
final class ErrorState extends RefreginatorListState {
  @override
  List<Object?> get props => [];
}

/// 로딩 완료 상태
///
/// 현재 식재료를 냉장 냉동으로 분류하여 반환함.
/// 기간임박이 true이면 기간임박한 재료만을 보여줌.
final class LoadedState extends RefreginatorListState {
  final List<RefreginatorIngredient> ingredients;
  final bool isWaringFilterOn;
  LoadedState({
    required this.ingredients,
    this.isWaringFilterOn = false,
  });

  List<RefreginatorIngredient> get myFreezedIngredients => ingredients
      .where((ingredient) => ingredient.isFreezed)
      .where((ingredient) => !isWaringFilterOn || ingredient.isWarning)
      .toList();

  List<RefreginatorIngredient> get myUnfreezedIngredients => ingredients
      .where((ingredient) => !ingredient.isFreezed)
      .where((ingredient) => !isWaringFilterOn || ingredient.isWarning)
      .toList();

  LoadedState copyWith({
    List<RefreginatorIngredient>? ingredients,
    bool? isWaringFilterOn,
  }) {
    return LoadedState(
      ingredients: ingredients ?? this.ingredients,
      isWaringFilterOn: isWaringFilterOn ?? this.isWaringFilterOn,
    );
  }

  @override
  List<Object?> get props => [
        ingredients,
      ];
}
