import 'package:flutter/material.dart';
import 'package:yum_application/src/data/recipe/model/recipe.dart';
import 'package:yum_application/src/data/recipe/repository/recipe_respository.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeRepository recipeRepository;
  List<Recipe> _recipes = List.empty(growable: true);

  RecipeViewModel({required this.recipeRepository});

  void _fetchData() {
    // api 요청
  }
}
