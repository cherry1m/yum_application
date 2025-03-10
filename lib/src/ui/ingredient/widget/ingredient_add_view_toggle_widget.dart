import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';

class IngredientAddViewToggleWidget extends StatelessWidget {
  const IngredientAddViewToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "냉동",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Consumer<NewRefreginatorIngredientViewModel>(
          builder: (context, provider, child) {
            return Switch.adaptive(
              value: provider.state.isFreezed,
              onChanged: (value) {
                provider.onEvent(ToggleSelectedIngredientIsFreezed());
              },
              activeColor: Theme.of(context).colorScheme.secondary,
              inactiveThumbColor: Colors.grey,
            );
          },
        ),
      ],
    );
  }
}
