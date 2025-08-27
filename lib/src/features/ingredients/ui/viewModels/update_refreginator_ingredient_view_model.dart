import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/update_refreginator_ingredient_event.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/update_refreginator_ingredient_state.dart';

part 'update_refreginator_ingredient_view_model.g.dart';

@riverpod
class UpdateRefreginatorIngredientViewModel
    extends _$UpdateRefreginatorIngredientViewModel {
  @override
  UpdateRefreginatorIngredientState build(RefreginatorIngredient ingredient) {
    return UpdateRefreginatorIngredientState.fromRefreginatorIngredient(
        ingredient);
  }

  onEvent(UpdateRefreginatorIngredientEvent event) {
    switch (event) {
      case IngredientChangeType():
        log('user ingredient category changed');
        state = state.copyWith(category: event.category);
      case IngredientToggleIsFreezed():
        log('user ingredient isFreezed toggled');
        state = state.copyWith(isFreezed: event.isFreezed);
      case IngredientChangeName():
        state = state.copyWith(name: event.name);
      case IngredientChangeStartAt():
        state = state.copyWith(startAt: event.startAt);
      case IngredientChangeEndAt():
        state = state.copyWith(
            endAt: event.endAt, overrideEndAt: event.endAt == null);
    }
  }
}
