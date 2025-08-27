import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_favorite_category_api.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';

class FavoriteCategoryRepositoryImpl extends FavoriteCategoryRepository {
  final RemoteFavoriteCategoryApi _remoteDatasource;

  FavoriteCategoryRepositoryImpl({
    required RemoteFavoriteCategoryApi remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  List<IngredientCategory> _cached = [];

  @override
  Future<List<IngredientCategory>> getFavorites() async {
    final response = await _remoteDatasource.getFavorites().then((response) =>
        response
            .map((favorite) => IngredientCategory.fromString(favorite.category))
            .toList());
    if (response.isNotEmpty) {
      _cached = response;
      return _cached;
    } else {
      return [];
    }
  }

  @override
  Future<IngredientCategory> createFavorite(IngredientCategory category) {
    return _remoteDatasource
        .createFavorite(category.toFavorite())
        .then((response) => IngredientCategory.fromString(response.category));
  }

  @override
  Future<void> deleteFavorite(IngredientCategory category) async {
    return _remoteDatasource.deleteFavorite(category.toFavorite());
  }
}
