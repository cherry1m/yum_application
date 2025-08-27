import 'package:equatable/equatable.dart';
import 'package:yum_application/src/core/extensions/date_format_extension.dart';
import 'package:yum_application/src/core/utils/date_utils.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';

import '../../data/model/ingredient.dart';

class RefreginatorIngredient extends Equatable {
  final String? id;

  /// [IngredientEntity]의 재료이름입니다.
  final String name;

  /// [IngredientEntity]의 재료의 냉동 여부입니다.
  ///
  /// true 또는 false가 지정됩니다.
  final bool isFreezed;

  /// [IngredientEntity]의 카테고리입니다.
  ///
  /// 카테고리를 통해서 asset 이미지 파일을 찾을 수 있습니다.
  final IngredientCategory category;

  /// [IngredientEntity]의 제조일입니다.
  ///
  /// 기본값으로 오늘날짜가 지정됩니다.
  final DateTime startAt;

  /// [IngredientEntity]의 유통기한입니다.
  ///
  /// 기본값으로 오늘날짜가 지정됩니다.
  final DateTime? endAt;

  const RefreginatorIngredient(
      {required this.id,
      required this.name,
      required this.category,
      required this.isFreezed,
      required this.startAt,
      required this.endAt});

  /// 재료 등록일의 YYYY년 MM월 DD일 포맷 변환 getter
  String get startAtKDateFormat => startAt.toyyyyMMdd();

  /// 재료 유통기한의 YYYY년 MM월 DD일 포맷 변환 getter
  String get endAtKDateFormat {
    if (endAt == null) return "";
    return endAt!.toyyyyMMdd();
  }

  /// 유통기한 임박 여부
  bool isWarning(DateTime? now) {
    return isNearExpiry(endAt, now ?? DateTime.now());
  }

  factory RefreginatorIngredient.fromResponse(Ingredient ingredient) {
    return RefreginatorIngredient(
        id: ingredient.id.toString(),
        name: ingredient.name,
        category: IngredientCategory.fromString(ingredient.category),
        isFreezed: ingredient.isFreezed,
        startAt: ingredient.startAt,
        endAt: ingredient.endAt);
  }

  Ingredient toRequest() {
    return Ingredient(
        id: id,
        name: name,
        category: category.name,
        isFreezed: isFreezed,
        startAt: startAt,
        endAt: endAt);
  }

  RefreginatorIngredient copyWith({
    String? id,
    String? name,
    bool? isFreezed,
    IngredientCategory? category,
    DateTime? startAt,
    Object? endAt = _undefined,
  }) {
    return RefreginatorIngredient(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        isFreezed: isFreezed ?? this.isFreezed,
        startAt: startAt ?? this.startAt,
        endAt: endAt == _undefined ? this.endAt : endAt as DateTime?);
  }

  static const Object _undefined = Object();

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        isFreezed,
        startAt,
        endAt,
      ];
}
