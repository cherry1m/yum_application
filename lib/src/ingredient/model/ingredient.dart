import 'package:flutter/material.dart';

class Ingredient {
  final String name;
  final Widget image;
  final IngredientCategory category;

  Ingredient({
    required this.name,
    required this.image,
    required this.category,
  });
}

enum IngredientCategory {
  meat,
  seafood,
  vegatable,
  fruit,
  processedFood,
  diaryProduct,
  drink
}
