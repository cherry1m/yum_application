import 'package:yum_application/src/features/ingredients/data/datasource/favorite_category_api.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';

class GetUserFavoriteCategoriesImpl extends GetUserFavoriteCategories {
  final FavoriteCategoryRepository _favoriteCategoryRepository;

  GetUserFavoriteCategoriesImpl({
    required FavoriteCategoryRepository favoriteCategoryRepository,
  }) : _favoriteCategoryRepository = favoriteCategoryRepository;

  @override
  Future<List<IngredientCategory>> call() {
    return _favoriteCategoryRepository.getFavorites();
  }
}

abstract class GetUserFavoriteCategories {
  Future<List<IngredientCategory>> call();
}
