import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_model.dart';

import '../model/new_refreginator_ingredient_model.dart';

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
            id: null,
            selectedIngredient: null,
            overrideSelectedIngredient: true,
            startAt: DateTime.now(),
            endAt: DateTime.now(),
            type: SelectType.create,
            isINF: false,
            isFreezed: false);

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
      case MoveToUpdatePrevIngredient():
        log("moveToUpdatePrevIngredient");
        final prevIngredient = event.prevIngredient;
        final prevBasicIngredient = BasicIngredient.fromEntity(prevIngredient);
        _state = _state.copyWith(
          id: prevIngredient.id,
          selectedIngredient: prevBasicIngredient,
          name: prevIngredient.name,
          isFreezed: prevIngredient.isFreezed,
          startAt: prevIngredient.startAt,
          endAt: prevIngredient.endAt,
          overrideSelectedIngredient: true,
          isINF: (prevIngredient.endAt == null) ? true : false,
          type: SelectType.update,
        );
      case ToggleSelectedIngredientIsINF():
        log("toggleNewIngredientIsINF");
        _state = _state.copyWith(
            isINF: event.isINF, endAt: null, overrideEndAt: true);
    }

    notifyListeners();
  }
}
