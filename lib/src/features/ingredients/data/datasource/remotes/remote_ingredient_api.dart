import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/ingredient_api.dart';
import 'package:yum_application/src/features/ingredients/data/model/ingredient.dart';

class RemoteIngredientApi extends IngredientApi {
  final FirebaseFirestore _firestore;

  RemoteIngredientApi({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @visibleForTesting
  static const collecion = 'ingredients';

  @override
  Stream<List<Ingredient>> getMyIngredient() {
    return _firestore.collection(collecion).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Ingredient.fromFirestore(doc)).toList());
  }

  @override
  Future<Ingredient> createNewIngredient(Ingredient ingredient) {
    return _firestore
        .collection(collecion)
        .add(ingredient.toJson())
        .then((documentSnapshot) {
      final id = documentSnapshot.id;
      final newIngredient = ingredient.copyWith(id: id);
      return newIngredient;
    });
  }

  @override
  Future<void> deleteIngredient(String id) async {
    _firestore.collection(collecion).doc(id).delete();
  }

  @override
  Future<void> updateIngredient(Ingredient ingredient) {
    return _firestore
        .collection(collecion)
        .doc(ingredient.id)
        .update(ingredient.toJson());
  }

  @override
  Future<void> createNewFavoriteIngredient(Map<String, dynamic> json) {
    // TODO: implement createNewFavoriteIngredient
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavoriteIngredient(Map<String, dynamic> json) {
    // TODO: implement deleteFavoriteIngredient
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getMyFavoriteIngredient() {
    // TODO: implement getMyFavoriteIngredient
    throw UnimplementedError();
  }
}
