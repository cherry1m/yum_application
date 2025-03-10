import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yum_application/src/data/ingredient/entity/refreginator_ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';

import '../refreginator_ingredient_list_model.dart';

class RefreginatorIngredientViewModel extends ChangeNotifier {
  final IngredientRepository ingredientRepository;

  /// 냉장고 식재료 상태 모델
  ///
  /// 현재 냉장고 식재료 리스트의 상태를 나타냅니다.
  /// 초기 모델은 Loading입니다.
  RefreginatorListState _state = LoadingState();

  RefreginatorListState get state => _state;

  RefreginatorIngredientViewModel({required this.ingredientRepository}) {
    fetchData();
    print("재료 뷰모델 생성");
  }

  /// 사용자가 자신의 모든 재료를 READ하는 메소드
  ///
  /// 사용자가 이 메소드를 호출하면 모든 재료를 불러오는 API 호출을 실행합니다.
  Future<void> fetchData() async {
    try {
      _state = LoadedState(
          ingredients: await ingredientRepository.getMyIngredient());

      // 상태 갱신 -> loading -> loaded
    } on Exception catch (e) {
      // 예를 들어, 에러상황에서는 토스트 메시지를 띄워서 사용자에게 알림을 보냄.
      _state = ErrorState();
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  void onEvent(RefreginatorIngredientListEvent event) async {
    switch (event) {
      case ToggleIsWarningFilterEvent():
        log("toggleIsWarningFilterEvent");
        if ((_state as LoadedState).isWaringFilterOn) {
          _state = (state as LoadedState).copyWith(
            isWaringFilterOn: false,
          );
        } else {
          _state = (state as LoadedState).copyWith(isWaringFilterOn: true);
        }
      case CreateRefreginatorIngredientEvent():
        log("createIngredient");
        await createNewIngredient(event.ingredient);
      case UpdateRefreginatorIngredientEvent():
        log("updateIngredient");
        await updateIngredient(event.ingredient);
      case DeleteRegreginatorIngredientEvent():
        log("deleteIngredient");
        deleteIngredient(event.ingredient);
    }

    notifyListeners();
  }

  /// 세로운 재료를 생성하는 API 호출 메소드입니다.
  ///
  /// 새로운 재료 생성에 성공한다면, 생성된 재료를 기존 재료 List에 추가합니다.
  /// 실패한다면 에러를 반환합니다.
  Future<void> createNewIngredient(RefreginatorIngredient newIngredient) async {
    try {
      final prevIngredients = (_state as LoadedState).ingredients;

      _state = (_state as LoadedState).copyWith(ingredients: [
        ...prevIngredients,
        await ingredientRepository.createNewIngredient(newIngredient)
      ]);

      // 선택 재료 초기화 및 화면 갱신
    } on Exception catch (e) {
      _state = ErrorState();
      rethrow;
    }
  }

  Future<void> updateIngredient(RefreginatorIngredient ingredient) async {
    try {
      final currState = (_state as LoadedState);

      // Api를 통해 재료 수정
      final result = await ingredientRepository.updateIngredient(ingredient);
      _state = currState.copyWith(
          ingredients: currState.ingredients.map((i) {
        if (i.id == result.id) {
          return result;
        } else {
          return i;
        }
      }).toList());
    } catch (e) {
      _state = ErrorState();
      rethrow;
    }
    print(_state);
  }

  /// 재료 삭제 API 호출 메소드
  ///
  /// 사용자가 자신의 재료를 삭제하는 경우 이 메소드를 통해서 삭제할 수 있습니다.
  Future<void> deleteIngredient(RefreginatorIngredient ingredient) async {
    try {
      ingredientRepository.deleteIngredient(ingredient.id!);
      final currState = (_state as LoadedState);
      _state = currState.copyWith(
          ingredients:
              currState.ingredients.where((i) => ingredient != i).toList());
    } on Exception catch (e) {
      _state = ErrorState();
      rethrow;
    }
  }
}
