import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_list_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/widget/refreginator_container.dart';

class MyRefreginatorFridgeView extends StatelessWidget {
  const MyRefreginatorFridgeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RefreginatorIngredientViewModel>();
    final state = viewModel.state as LoadedState;
    return Padding(
        key: const Key("fridge"),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: RefreginatorContainer(
            label: "냉장 보관",
            rowCount: 3,
            children: state.myUnfreezedIngredients));
  }
}
