import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

abstract class IngredientRepository {
  Stream<List<RefreginatorIngredient>> getMyIngredient();

  Future<RefreginatorIngredient> createNewIngredient(
      RefreginatorIngredient ingredient);

  Future<void> deleteIngredient(String id);

  Future<void> updateIngredient(RefreginatorIngredient ingredient);
}
