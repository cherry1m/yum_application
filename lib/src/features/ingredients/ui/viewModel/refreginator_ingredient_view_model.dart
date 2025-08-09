import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yum_application/src/features/ingredients/data/entity/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/data/repository/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/di/ingredient_di.dart';

import '../../data/model/refreginator_ingredient_list_model.dart';

part 'refreginator_ingredient_view_model.g.dart';

@riverpod
class RefreginatorIngredientViewModel
    extends _$RefreginatorIngredientViewModel {
  @override
  RefreginatorListState build() {
    fetchData();
    return LoadingState();
  }

  /// 사용자가 자신의 모든 재료를 READ하는 메소드
  ///
  /// 사용자가 이 메소드를 호출하면 모든 재료를 불러오는 API 호출을 실행합니다.
  Future<void> fetchData() async {
    final ingredients = await ref
        .read(ingredientRepositoryProvider)
        .getMyIngredient()
        // .map((list) => list ?? [])
        .first;
    state = LoadedState(ingredients: ingredients);
  }

  Future<void> onEvent(RefreginatorIngredientListEvent event) async {
    switch (event) {
      case ToggleIsWarningFilterEvent():
        log("toggleIsWarningFilterEvent");
      // if ((_state as LoadedState).isWaringFilterOn) {
      //   _state = (state as LoadedState).copyWith(
      //     isWaringFilterOn: false,
      //   );
      // } else {
      //   _state = (state as LoadedState).copyWith(isWaringFilterOn: true);
      // }
      case CreateRefreginatorIngredientEvent():
        log("createIngredient");
      // await createNewIngredient(event.ingredient);
      case UpdateRefreginatorIngredientEvent():
        log("updateIngredient");
      // await updateIngredient(event.ingredient);
      case DeleteRegreginatorIngredientEvent():
        log("deleteIngredient");
      // deleteIngredient(event.ingredient);
    }

    // notifyListeners();
  }

  /// 세로운 재료를 생성하는 API 호출 메소드입니다.
  ///
  /// 새로운 재료 생성에 성공한다면, 생성된 재료를 기존 재료 List에 추가합니다.
  /// 실패한다면 에러를 반환합니다.
  // Future<void> createNewIngredient(RefreginatorIngredient newIngredient) async {
  //   try {
  //     final prevIngredients = (_state as LoadedState).ingredients;

  //     _state = (_state as LoadedState).copyWith(ingredients: [
  //       ...prevIngredients,
  //       await ingredientRepository.createNewIngredient(newIngredient)
  //     ]);

  //     // 선택 재료 초기화 및 화면 갱신
  //   } on Exception catch (e) {
  //     _state = ErrorState();
  //     rethrow;
  //   }
  // }

  // Future<void> updateIngredient(RefreginatorIngredient ingredient) async {
  //   try {
  //     final currState = (_state as LoadedState);

  //     // Api를 통해 재료 수정
  //     final result = await ingredientRepository.updateIngredient(ingredient);
  //     _state = currState.copyWith(
  //         ingredients: currState.ingredients.map((i) {
  //       if (i.id == result.id) {
  //         return result;
  //       } else {
  //         return i;
  //       }
  //     }).toList());
  //   } catch (e) {
  //     _state = ErrorState();
  //     rethrow;
  //   }
  // }

  // /// 재료 삭제 API 호출 메소드
  // ///
  // /// 사용자가 자신의 재료를 삭제하는 경우 이 메소드를 통해서 삭제할 수 있습니다.
  // Future<void> deleteIngredient(RefreginatorIngredient ingredient) async {
  //   try {
  //     ingredientRepository.deleteIngredient(ingredient.id!);
  //     final currState = (_state as LoadedState);
  //     _state = currState.copyWith(
  //         ingredients:
  //             currState.ingredients.where((i) => ingredient != i).toList());
  //   } on Exception catch (e) {
  //     _state = ErrorState();
  //     rethrow;
  //   }
  // }
}
