import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yum_application/src/core/di/app_provider.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/remote_ingredient_api.dart';
import 'package:yum_application/src/features/ingredients/data/repository/ingredient_repository.dart';

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
