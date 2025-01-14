import 'package:flutter/foundation.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';

class IngredientViewModel extends ChangeNotifier {
  final IngredientRepository ingredientRepository;
  List<Ingredient> _myIngredients = List.empty();

  /// 나의 냉동 재료 getter
  List<Ingredient> get myFreezedIngredients {
    return _myIngredients
        .where((ingredient) => ingredient.isFreezed == true)
        .toList();
  }

  /// 나의 냉장 재료 getter
  List<Ingredient> get myUnfreezedIngredients {
    return _myIngredients
        .where((ingredient) => ingredient.isFreezed == false)
        .toList();
  }

  IngredientViewModel({required this.ingredientRepository}) {
    _fetchData();
  }

  Ingredient? _selectedIngredient;
  Ingredient? get selectedIngredient => _selectedIngredient;

  bool _isFreezed = false;
  bool get isFreezed => _isFreezed;

  void _fetchData() async {
    try {
      final result = await ingredientRepository.getMyIngredient();
      _myIngredients = result;
      notifyListeners();
    } on Exception catch (e) {
      // 예를 들어, 에러상황에서는 토스트 메시지를 띄워서 사용자에게 알림을 보냄.
      throw Exception("재료 불러오기 에러");
    }
  }

  void createNewIngredient() async {
    // 선택한 재료가 없으면 return;
    if (_selectedIngredient == null) {
      return;
    }
    try {
      // 선택한 재료를 타겟으로 설정
      final newIngredient = selectedIngredient;
      final result =
          await ingredientRepository.createNewIngredient(newIngredient!);
      // 냉장고에 새로운 재료 추가
      _myIngredients.add(result);
      // 화면을 다시 그림
      notifyListeners();
    } on Exception catch (e) {
      throw Exception("재료 생성 에러");
    }
  }

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
