import 'package:flutter/foundation.dart';
import 'package:yum_application/src/ingredient/model/ingredient.dart';

class IngredientViewModel extends ChangeNotifier {
  Ingredient? _selectedIngredient;

  Ingredient? get selectedIngredient => _selectedIngredient;

  void selectIngredient(Ingredient ingredient) {
    _selectedIngredient = ingredient;
    notifyListeners();
  }

  void cancel() {
    _selectedIngredient = null;
    notifyListeners();
  }
}
