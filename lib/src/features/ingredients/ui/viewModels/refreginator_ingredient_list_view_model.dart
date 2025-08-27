import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yum_application/src/features/ingredients/di/ingredient_di.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';

import 'refreginator_ingredient_list_event.dart';
import 'refreginator_ingredient_list_state.dart';

part 'refreginator_ingredient_list_view_model.g.dart';

@riverpod
class RefreginatorIngredientListViewModel
    extends _$RefreginatorIngredientListViewModel {
  StreamSubscription<List<RefreginatorIngredient>>? _subscription;

  @override
  RefreginatorIngredientListState build() {
    _subscribeToIngredients();
    return const RefreginatorIngredientListState();
  }

  void _subscribeToIngredients() {
    // 기존 구독 해제
    _subscription?.cancel();

    // Repository에서 Stream<List<IngredientEntity>> 구독
    final stream = ref.read(getUserIngredientsProvider).call();

    _subscription = stream.listen((ingredients) {
      state = state.copyWith(
          ingredients: ingredients,
          status: RefreginatorIngredientListStatus.success);
    }, onError: (error) {
      log(error.toString());
      state = state.copyWith(status: RefreginatorIngredientListStatus.failure);
    });
  }

  /// 사용자가 자신의 모든 재료를 READ하는 메소드
  ///
  /// 사용자가 이 메소드를 호출하면 모든 재료를 불러오는 API 호출을 실행합니다.
  Future<void> fetchData() async {
    _subscribeToIngredients();
  }

  Future<void> onEvent(RefreginatorIngredientListEvent event) async {
    switch (event) {
      case IngredientsLoad():
        log('load user ingredients list');
        await fetchData();
        break;
      case IngredientCreateReqeust():
        final ingredient = event.ingredient;
        final prevIngredients = state.ingredients;
        state = state.copyWith(ingredients: [...prevIngredients, ingredient]);
        final newIngredient =
            await ref.read(createUserIngredientProvider).call(ingredient);
        state =
            state.copyWith(ingredients: [...prevIngredients, newIngredient]);
        break;

      case IngredientDeleteRequest():
        final id = event.id;
        final prevIngredients = state.ingredients;

        state = state.copyWith(
            ingredients: prevIngredients.where((it) => it.id != id).toList());
        await ref.read(deleteUserIngredientProvider).call(id);
        break;

      case IngredientUpdateRequest():
        final ingredient = event.ingredient;
        final prevIngredients = state.ingredients;
        state = state.copyWith(
            ingredients: prevIngredients.map((it) {
          if (it.id == ingredient.id) {
            return ingredient;
          } else {
            return it;
          }
        }).toList());
        await ref.read(updateUserIngredientProvider).call(ingredient);
        break;

      case RefreginatorWarningFilterToggled():
        log('user tap waring filter');
        state = state.copyWith(
          isWarningFilterOn: event.isOn,
        );
        break;
    }

    // notifyListeners();
  }
}
