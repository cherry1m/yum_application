import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_model.dart';

/// 사용자의 재료는 3일을 기준으로 유통기한 임박을 표시하게 됩니다.
extension IsWarningExtension on RefreginatorIngredient {
  /// [Ingredient]의 유통기한 임박 관련 bool getter입니다.
  ///
  /// 유통기한이 3일 이하로 남은 경우에는 true가 반환됩니다.
  /// 그렇지 않은 경우에는 false가 반환됩니다.
  bool get isWarning {
    final now = DateTime.now();
    final th = DateTime(now.year, now.month, now.day);
    if (endAt == null) {
      return false;
    }
    final diff = endAt!.difference(th).inDays;
    if (diff <= 3) {
      return true;
    } else {
      return false;
    }
  }
}
