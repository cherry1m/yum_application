import 'package:flutter/foundation.dart';
import 'package:yum_application/src/ingredient/model/ingredient.dart';

class IngredientViewModel extends ChangeNotifier {
  Ingredient? _selectedIngredient;
  Ingredient? get selectedIngredient => _selectedIngredient;

  bool _isFreezed = false;
  bool get isFreezed => _isFreezed;

  void selectIngredient(Ingredient ingredient) {
    ingredient.isFreezed = _isFreezed;
    _selectedIngredient = ingredient;
    notifyListeners();
  }

  void cancel() {
    _selectedIngredient = null;
    notifyListeners();
  }

  void toggleIsFreezed(bool value) {
    if (_selectedIngredient != null) {
      _selectedIngredient!.isFreezed = !isFreezed;
    }
    _isFreezed = !_isFreezed;
    notifyListeners();
  }
}
