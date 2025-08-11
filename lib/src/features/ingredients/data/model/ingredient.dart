import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:yum_application/src/core/extensions/date_format_extension.dart';

final class Ingredient extends Equatable {
  /// [RefreginatorIngredient]의 식별자입니다.
  ///
  /// id는 사용자가 생성하는 경우에만 null이며,
  /// 서버로부터 불러온 재료는 모두 null이 될 수 없습니다.
  final String? id;

  /// [RefreginatorIngredient]의 재료이름입니다.
  final String name;

  /// [RefreginatorIngredient]의 재료의 냉동 여부입니다.
  ///
  /// true 또는 false가 지정됩니다.
  final bool isFreezed;

  /// [RefreginatorIngredient]의 카테고리입니다.
  ///
  /// 카테고리를 통해서 asset 이미지 파일을 찾을 수 있습니다.
  final String category;

  /// [RefreginatorIngredient]의 제조일입니다.
  ///
  /// 기본값으로 오늘날짜가 지정됩니다.
  final DateTime startAt;

  /// [RefreginatorIngredient]의 유통기한입니다.
  ///
  /// 기본값으로 오늘날짜가 지정됩니다.
  final DateTime? endAt;

  /// [RefreginatorIngredient]의 기본 생성자입니다.
  ///
  /// 재료 생성 중에 사용되는 생성자입니다.
  const Ingredient({
    required this.id,
    required this.name,
    required this.category,
    required this.isFreezed,
    required this.startAt,
    required this.endAt,
  });

  /// [Ingredient]의 Deserializes 메소드입니다.
  ///
  /// JSON 데이터를 [Ingredient]로 역직렬화합니다.
  factory Ingredient.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Ingredient(
        id: snapshot.id,
        name: data['name'],
        isFreezed: data['isFreezed'],
        category: data['category'],
        startAt: (data['startAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        endAt: (data['endAt'] as Timestamp?)?.toDate());
  }

  /// [Ingredient]의 serializes 메소드입니다.
  /// JSON 데이터로 직렬화를 수행합니다.
  ///
  /// 재료의 id 필드가 지정되지 않은 경우에는 재료가 새롭게 create되며,
  /// id가 존재하는 경우에는 update됩니다.
  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'name': name,
        "isFreezed": isFreezed,
        "category": category,
        "startAt": startAt.toyyyyMMdd(),
        if (endAt != null) 'endAt': endAt!.toyyyyMMdd(),
      };

  Ingredient copyWith({
    String? id,
    String? name,
    bool? isFreezed,
    String? category,
    DateTime? startAt,
    Object? endAt = _undefined,
  }) {
    return Ingredient(
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
