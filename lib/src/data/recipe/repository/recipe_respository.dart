import 'package:yum_application/src/data/recipe/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/recipe/model/recipe.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RemoteDatasource remoteDatasource;

  RecipeRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Recipe>> getAllRecipes() {
    return remoteDatasource.getAllRecipes().then(
        (response) => response.map((json) => Recipe.fromJson(json)).toList());
  }
}

abstract class RecipeRepository {
  Future<List<Recipe>> getAllRecipes();
}
