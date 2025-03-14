import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_list_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/widget/refreginator_container.dart';

class MyRefreginatorFreezerView extends StatelessWidget {
  const MyRefreginatorFreezerView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RefreginatorIngredientViewModel>();
    final state = viewModel.state as LoadedState;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: RefreginatorContainer(
            label: "냉동 보관", children: state.myFreezedIngredients));
  }
}
