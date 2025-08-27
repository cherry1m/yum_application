import 'package:yum_application/src/features/ingredients/data/model/ingredient.dart';

abstract class IngredientApi {
  Stream<List<Ingredient>> getMyIngredient();

  Future<Ingredient> createNewIngredient(Ingredient ingredient);

  Future<void> updateIngredient(Ingredient ingredient);

  Future<void> deleteIngredient(String id);
}
