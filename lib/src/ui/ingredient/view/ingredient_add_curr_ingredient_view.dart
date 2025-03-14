import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/core/constants/basic_ingredient.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_state.dart';
import 'package:yum_application/src/ui/ingredient/view/select_ingredient_image.dart';
import 'package:yum_application/src/ui/ingredient/view/un_select_ingredient_image.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';

/// 선택한 재료가 있는 경우
///
/// 현재 선택된 재료 이미지를 볼 수 있음.
class IngredientAddCurrIngredientView extends StatelessWidget {
  const IngredientAddCurrIngredientView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewRefreginatorIngredientViewModel>();
    final currIngredient = viewModel.state.selectedIngredient;
    return switch (currIngredient) {
      BasicIngredient() => SelectIngredientImage(
          ingredient: currIngredient,
          width: 250,
        ),
      _ => const UnSelectIngredientImage(),
    };
  }
}
