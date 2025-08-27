import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FavoriteCategory extends Equatable {
  final String category;

  const FavoriteCategory({
    required this.category,
  });

  factory FavoriteCategory.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return FavoriteCategory(category: snapshot.id);
  }

  FavoriteCategory copyWith({
    String? category,
  }) {
    return FavoriteCategory(category: category ?? this.category);
  }

  @override
  List<Object?> get props => [
        category,
      ];
}
