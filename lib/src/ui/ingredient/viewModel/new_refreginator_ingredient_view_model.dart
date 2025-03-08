import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/ingredient/model/model.dart';

import '../new_refreginator_ingredient_model.dart';

class NewRefreginatorIngredientViewModel extends ChangeNotifier {
  SelectedNewRefreginatorIngredient _state =
      SelectedNewRefreginatorIngredient();

  SelectedNewRefreginatorIngredient get state => _state;

  BasicIngredient? get selectedIngredient {
    return state.selectedIngredient;
  }

  void onEvent(NewRefreginatorIngredientEvent event) {
    switch (event) {
      case UnSelectedNewIngredientEvent():
        log("unselect");
        _state = _state.copyWith(
            selectedIngredient: null, overrideSelectedIngredient: true);

      case SelectNewIngredientEvent():
        log("select");
        _state = _state.copyWith(selectedIngredient: event.selectIngredient);

      case UpdateSelectedIngredientName():
        log("updatename");
        _state = _state.copyWith(name: event.newName);

      case UpdateSelectedIngredientStartAt():
        log("updateStartAt");
        _state = _state.copyWith(startAt: event.newStartAt);
      case UpdateSelectedIngredientEndAt():
        log("updateEndAt");
        _state = _state.copyWith(endAt: event.newEndAt);

      case ToggleSelectedIngredientIsFreezed():
        log("toggleIsFreezed");
        _state = _state.copyWith(isFreezed: !_state.isFreezed);
    }

    notifyListeners();
  }
}
