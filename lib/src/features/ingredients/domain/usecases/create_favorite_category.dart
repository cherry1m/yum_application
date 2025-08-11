import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';

class CreateFavoriteCategoryImpl extends CreateFavoriteCategory {
  final FavoriteCategoryRepository _favoriteCategoryRepository;

  CreateFavoriteCategoryImpl({
    required FavoriteCategoryRepository favoriteCategoryRepository,
  }) : _favoriteCategoryRepository = favoriteCategoryRepository;

  @override
  Future<IngredientCategory> call(IngredientCategory category) {
    return _favoriteCategoryRepository.createFavorite(category);
  }
}

abstract class CreateFavoriteCategory {
  Future<IngredientCategory> call(IngredientCategory category);
}
