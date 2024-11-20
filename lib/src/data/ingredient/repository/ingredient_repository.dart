import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';

class IngredientRepository {
  final RemoteDatasource remoteDatasource;

  IngredientRepository({required this.remoteDatasource});

  /// 나의 냉장고 재료 조회 Api
  Future<List<Ingredient>> getMyIngredient() async {
    return remoteDatasource.getMyIngredient().then((response) =>
        response.map((json) => Ingredient.fromJson(json)).toList());
  }
}
