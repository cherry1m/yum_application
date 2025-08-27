import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yum_application/src/core/di/app_provider.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_favorite_category_api.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_ingredient_api.dart';
import 'package:yum_application/src/features/ingredients/data/repository/favorite_category_repository_impl.dart';
import 'package:yum_application/src/features/ingredients/data/repository/ingredient_repository_impl.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/create_favorite_category.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/create_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/delete_favorite_category.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/delete_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/get_user_favorite_categories.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/get_user_ingredients.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/update_user_ingredient.dart';

part 'ingredient_di.g.dart';

@riverpod
RemoteIngredientApi remoteIngredientApi(Ref ref) {
  return RemoteIngredientApi(firestore: ref.read(firebaseFirestoreProvider));
}

@riverpod
IngredientRepository ingredientRepository(Ref ref) {
  return IngredientRepositoryImpl(
      remoteDatasource: ref.read(remoteIngredientApiProvider));
}

@riverpod
GetUserIngredients getUserIngredients(Ref ref) {
  return GetUserIngredientsImpl(
      ingredientRepository: ref.read(ingredientRepositoryProvider));
}

@riverpod
CreateUserIngredient createUserIngredient(Ref ref) {
  return CreateUserIngredientImpl(
      ingredientRepository: ref.read(ingredientRepositoryProvider));
}

@riverpod
DeleteUserIngredient deleteUserIngredient(Ref ref) {
  return DeleteUserIngredientImpl(
      ingredientRepository: ref.read(ingredientRepositoryProvider));
}

@riverpod
UpdateUserIngredient updateUserIngredient(Ref ref) {
  return UpdateUserIngredientImpl(
      ingredientRepository: ref.read(ingredientRepositoryProvider));
}

@riverpod
RemoteFavoriteCategoryApi remoteFavoriteCategoryApi(Ref ref) {
  return RemoteFavoriteCategoryApi(
      firestore: ref.read(firebaseFirestoreProvider));
}

@riverpod
FavoriteCategoryRepository favoriteCategoryRepository(Ref ref) {
  return FavoriteCategoryRepositoryImpl(
      remoteDatasource: ref.read(remoteFavoriteCategoryApiProvider));
}

@riverpod
GetUserFavoriteCategories getUserFavoriteCategories(Ref ref) {
  return GetUserFavoriteCategoriesImpl(
      favoriteCategoryRepository: ref.read(favoriteCategoryRepositoryProvider));
}

@riverpod
CreateFavoriteCategory createFavoriteCategory(Ref ref) {
  return CreateFavoriteCategoryImpl(
      favoriteCategoryRepository: ref.read(favoriteCategoryRepositoryProvider));
}

@riverpod
DeleteFavoriteCategory deleteFavoriteCategory(Ref ref) {
  return DeleteFavoriteCategoryImpl(
      favoriteCategoryRepository: ref.read(favoriteCategoryRepositoryProvider));
}
