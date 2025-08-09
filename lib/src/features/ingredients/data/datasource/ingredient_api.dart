import 'package:yum_application/src/features/ingredients/data/entity/refreginator_ingredient.dart';

abstract class IngredientApi {
  Stream<List<RefreginatorIngredient>> getMyIngredient();

  Future<Map<String, dynamic>> createNewIngredient(Map<String, dynamic> json);

  Future<Map<String, dynamic>> updateIngredient(Map<String, dynamic> json);

  Future<List<Map<String, dynamic>>> getMyFavoriteIngredient();

  Future<void> deleteIngredient(int id);

  Future<void> createNewFavoriteIngredient(Map<String, dynamic> json);

  Future<void> deleteFavoriteIngredient(Map<String, dynamic> json);
}
