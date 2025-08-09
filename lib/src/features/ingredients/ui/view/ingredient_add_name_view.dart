import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/features/ingredients/data/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/new_refreginator_ingredient_view_model.dart';

class IngredientAddNameView extends StatelessWidget {
  const IngredientAddNameView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = context.watch<NewRefreginatorIngredientViewModel>();
    return Row(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                "재료 이름",
                style: theme.textTheme.headlineSmall,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: 155,
              height: 44,
              child: TextField(
                onChanged: (value) => viewModel
                    .onEvent(UpdateSelectedIngredientName(newName: value)),
                decoration: InputDecoration(
                  // 재료가 선택되면 선택한 기본재료의 이름이 hintLabel로 지정됨.
                  hintText: viewModel.selectedIngredient?.name ?? "",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )
        ]),
      ],
    );
  }
}
