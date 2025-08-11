import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';

class DeleteFavoriteCategoryImpl extends DeleteFavoriteCategory {
  final FavoriteCategoryRepository _favoriteCategoryRepository;

  DeleteFavoriteCategoryImpl({
    required FavoriteCategoryRepository favoriteCategoryRepository,
  }) : _favoriteCategoryRepository = favoriteCategoryRepository;

  @override
  Future<void> call(String id) {
    return _favoriteCategoryRepository.deleteFavorite(id);
  }
}

abstract class DeleteFavoriteCategory {
  Future<void> call(String id);
}
