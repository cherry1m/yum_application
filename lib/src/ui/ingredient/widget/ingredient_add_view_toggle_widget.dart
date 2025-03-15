import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';

class IngredientAddViewToggleWidget extends StatelessWidget {
  const IngredientAddViewToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NewRefreginatorIngredientViewModel>();
    final state = viewModel.state;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "냉동",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Switch.adaptive(
          value: state.isFreezed,
          onChanged: (value) {
            viewModel.onEvent(ToggleSelectedIngredientIsFreezed());
          },
          activeColor: Theme.of(context).colorScheme.secondary,
          inactiveThumbColor: Colors.grey,
        )
      ],
    );
  }
}
