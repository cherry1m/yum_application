import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

enum RefreginatorIngredientListStatus { init, loading, success, failure }

/// 로딩 완료 상태
///
/// 현재 식재료를 냉장 냉동으로 분류하여 반환함.
/// 기간임박이 true이면 기간임박한 재료만을 보여줌.
final class RefreginatorIngredientListState extends Equatable {
  final List<RefreginatorIngredient> ingredients;
  final bool isWarningFilterOn;
  final RefreginatorIngredientListStatus status;
  const RefreginatorIngredientListState({
    this.ingredients = const [],
    this.isWarningFilterOn = false,
    this.status = RefreginatorIngredientListStatus.init,
  });

  /// 필터 여부에 따른 재료 목록 반환
  ///
  ///
  List<RefreginatorIngredient> filteredIngredientsAt(DateTime now) {
    return ingredients
        .where((it) => !isWarningFilterOn || it.isWarning(now))
        .toList();
  }

  /// 냉동 재료 목록 반환
  ///
  ///
  List<RefreginatorIngredient> myFreezedIngredientsAt(DateTime now) =>
      filteredIngredientsAt(now)
          .where((ingredient) => ingredient.isFreezed)
          .toList();

  /// 냉장 재료 목록 반환
  ///
  ///

  List<RefreginatorIngredient> myUnfreezedIngredientsAt(DateTime now) =>
      filteredIngredientsAt(now)
          .where((ingredient) => !ingredient.isFreezed)
          .toList();

  RefreginatorIngredientListState copyWith(
      {List<RefreginatorIngredient>? ingredients,
      bool? isWarningFilterOn,
      RefreginatorIngredientListStatus? status}) {
    return RefreginatorIngredientListState(
      ingredients: ingredients ?? this.ingredients,
      isWarningFilterOn: isWarningFilterOn ?? this.isWarningFilterOn,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        ingredients,
        isWarningFilterOn,
        status,
      ];
}
