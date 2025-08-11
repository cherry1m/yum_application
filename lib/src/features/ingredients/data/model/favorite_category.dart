import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FavoriteCategory extends Equatable {
  final String? id;
  final String category;

  const FavoriteCategory({
    required this.id,
    required this.category,
  });

  factory FavoriteCategory.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return FavoriteCategory(id: snapshot.id, category: data?['category']);
  }

  Map<String, dynamic> toFirestore() => {
        if (id != null) 'id': id,
        'category': category,
      };

  FavoriteCategory copyWith({
    String? id,
    String? category,
  }) {
    return FavoriteCategory(
        id: id ?? this.id, category: category ?? this.category);
  }

  @override
  List<Object?> get props => [
        id,
        category,
      ];
}
