import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_state.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_list_event.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/widget/single_button.dart';

class IngredientAddButtonView extends StatelessWidget {
  const IngredientAddButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final RefreginatorIngredientViewModel refreginatorIngredientListViewModel =
        context.read<RefreginatorIngredientViewModel>();
    final NewRefreginatorIngredientViewModel
        newRefreginatorIngredientViewModel =
        context.read<NewRefreginatorIngredientViewModel>();
    return SingleButton(
      text: "등록하기",
      onTap: () async {
        final resultIngredient =
            newRefreginatorIngredientViewModel.state.toNewIngredient();
        if (newRefreginatorIngredientViewModel.state.type ==
            SelectType.create) {
          refreginatorIngredientListViewModel.onEvent(
              CreateRefreginatorIngredientEvent(ingredient: resultIngredient));
        } else {
          refreginatorIngredientListViewModel.onEvent(
              UpdateRefreginatorIngredientEvent(ingredient: resultIngredient));
        }

        Navigator.of(context).pop();
      },
    );
  }
}
