import 'package:flutter/material.dart';
import 'package:yum_application/src/data/recipe/model/recipe.dart';
import 'package:yum_application/src/data/recipe/repository/recipe_respository.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository recipeRepository;
  List<Recipe> _recipes = List.empty(growable: true);

  List<Recipe> get recipes => _recipes;

  RecipeViewModel({required this.recipeRepository}) {
    _fetchData();
    print("레시피 뷰모델 생성");
  }

  void _fetchData() async {
    final result = await recipeRepository.getAllRecipes();
    print(result);
    _recipes.clear();
    _recipes.addAll(result);
    notifyListeners();
  }
}
