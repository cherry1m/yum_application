import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';

class DeleteFavoriteCategoryImpl extends DeleteFavoriteCategory {
  final FavoriteCategoryRepository _favoriteCategoryRepository;

  DeleteFavoriteCategoryImpl({
    required FavoriteCategoryRepository favoriteCategoryRepository,
  }) : _favoriteCategoryRepository = favoriteCategoryRepository;

  @override
  Future<void> call(IngredientCategory category) {
    return _favoriteCategoryRepository.deleteFavorite(category);
  }
}

abstract class DeleteFavoriteCategory {
  Future<void> call(IngredientCategory category);
}
