import 'dart:developer';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_event.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_state.dart';

part 'create_refreginator_ingredient_view_model.g.dart';

@riverpod
class CreateRefreginatorIngredientViewModel
    extends _$CreateRefreginatorIngredientViewModel {
  @override
  CreateRefreginatorIngredientState build() {
    return CreateRefreginatorIngredientState();
  }

  void onEvent(CreateRefreginatorIngredientEvent event) {
    switch (event) {
      case UnSelectedNewIngredientEvent():
        log("unselect");
        state = state.copyWith(
            id: null,
            selectedIngredient: null,
            overrideSelectedIngredient: true,
            startAt: state.startAt,
            endAt: state.endAt,
            overrideEndAt: true,
            isINF: state.isINF,
            isFreezed: state.isFreezed);

      case SelectNewIngredientEvent():
        log("select");
        final ingredient = event.selectIngredient;
        state = state.copyWith(
            selectedIngredient: ingredient,
            name: ingredient.name,
            isFreezed: state.isFreezed,
            startAt: state.startAt,
            endAt: state.endAt,
            overrideEndAt: true,
            isINF: state.isINF);

      case UpdateSelectedIngredientName():
        log("updatename");
        state = state.copyWith(name: event.newName);

      case UpdateSelectedIngredientStartAt():
        log("updateStartAt");
        state = state.copyWith(startAt: event.newStartAt);
      case UpdateSelectedIngredientEndAt():
        log("updateEndAt");
        state = state.copyWith(endAt: event.newEndAt);

      case ToggleSelectedIngredientIsFreezed():
        log("toggleIsFreezed");
        state = state.copyWith(isFreezed: !state.isFreezed);

      case ToggleSelectedIngredientIsINF():
        log("toggleNewIngredientIsINF");
        state = state.copyWith(
            isINF: event.isINF, endAt: null, overrideEndAt: true);
    }
  }
}
