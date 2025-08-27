import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';

abstract class FavoriteCategoryRepository {
  Future<List<IngredientCategory>> getFavorites();

  Future<IngredientCategory> createFavorite(IngredientCategory category);

  Future<void> deleteFavorite(IngredientCategory category);
}
