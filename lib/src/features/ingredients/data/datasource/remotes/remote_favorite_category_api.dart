import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:yum_application/src/core/di/app_provider.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/favorite_category_api.dart';
import 'package:yum_application/src/features/ingredients/data/model/favorite_category.dart';

class RemoteFavoriteCategoryApi extends FavoriteCategoryApi {
  final FirebaseFirestore _firestore;

  RemoteFavoriteCategoryApi({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @visibleForTesting
  static const collections = "favorites";

  /// 사용자 즐겨찾기 카테고리 가져오기
  ///
  ///
  @override
  Future<List<FavoriteCategory>> getFavorites() {
    return _firestore.collection(collections).get().then((querySnapshot) =>
        querySnapshot.docs
            .map((snapshot) => FavoriteCategory.fromFirestore(snapshot))
            .toList());
  }

  /// 사용자 즐겨찾기 식재료 카테고리 추가
  ///
  ///
  @override
  Future<FavoriteCategory> createFavorite(FavoriteCategory favorite) {
    return _firestore
        .collection(collections)
        .add(favorite.toFirestore())
        .then((documentSnapshot) {
      final id = documentSnapshot.id;
      final newFavorite = favorite.copyWith(id: id);
      return newFavorite;
    });
  }

  /// 사용자 즐겨찾기 식재료 삭제
  ///
  ///
  @override
  Future<void> deleteFavorite(String id) async {
    await _firestore.collection(collections).doc(id).delete();
  }
}
