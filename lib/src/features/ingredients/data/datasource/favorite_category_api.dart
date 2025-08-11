import 'package:yum_application/src/features/ingredients/data/model/favorite_category.dart';

abstract class FavoriteCategoryApi {
  Future<List<FavoriteCategory>> getFavorites();

  Future<FavoriteCategory> createFavorite(FavoriteCategory favorite);

  Future<void> deleteFavorite(String id);
}
