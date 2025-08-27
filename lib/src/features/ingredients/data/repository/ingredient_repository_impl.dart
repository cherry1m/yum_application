import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_ingredient_api.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  const IngredientRepositoryImpl(
      {required RemoteIngredientApi remoteDatasource})
      : _remoteDatasource = remoteDatasource;
  final RemoteIngredientApi _remoteDatasource;

  @override
  Stream<List<RefreginatorIngredient>> getMyIngredient() {
    return _remoteDatasource.getMyIngredient().map((ingredients) => ingredients
        .map((response) => RefreginatorIngredient.fromResponse(response))
        .toList());
  }

  /// 재료 생성
  @override
  Future<RefreginatorIngredient> createNewIngredient(
      RefreginatorIngredient ingredient) async {
    final response =
        await _remoteDatasource.createNewIngredient(ingredient.toRequest());
    return RefreginatorIngredient.fromResponse(response);
  }

  @override
  Future<void> deleteIngredient(String id) {
    return _remoteDatasource.deleteIngredient(id);
  }

  @override
  Future<void> updateIngredient(RefreginatorIngredient ingredient) {
    return _remoteDatasource.updateIngredient(ingredient.toRequest());
  }
}
