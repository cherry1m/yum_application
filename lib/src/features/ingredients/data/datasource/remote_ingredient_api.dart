import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/ingredient_api.dart';
import 'package:yum_application/src/features/ingredients/data/entity/refreginator_ingredient.dart';

final class RemoteIngredientApi extends IngredientApi {
  final FirebaseFirestore _firestore;

  RemoteIngredientApi({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<void> createNewFavoriteIngredient(Map<String, dynamic> json) {
    // TODO: implement createNewFavoriteIngredient
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> createNewIngredient(Map<String, dynamic> json) {
    // TODO: implement createNewIngredient
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavoriteIngredient(Map<String, dynamic> json) {
    // TODO: implement deleteFavoriteIngredient
    throw UnimplementedError();
  }

  @override
  Future<void> deleteIngredient(int id) {
    // TODO: implement deleteIngredient
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getMyFavoriteIngredient() {
    // TODO: implement getMyFavoriteIngredient
    throw UnimplementedError();
  }

  @override
  Stream<List<RefreginatorIngredient>> getMyIngredient() {
    return _firestore
        .collection('ingredients')
        .doc("l7MQo3xjDdzLTC1bytWv")
        .collection('ingredients')
        .snapshots()
        .map((snapshot) {
      log(snapshot.docs.isEmpty.toString());
      return [];
    });
  }

  @override
  Future<Map<String, dynamic>> updateIngredient(Map<String, dynamic> json) {
    // TODO: implement updateIngredient
    throw UnimplementedError();
  }
}
