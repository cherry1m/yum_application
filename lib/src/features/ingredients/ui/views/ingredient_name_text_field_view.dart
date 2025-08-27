import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_event.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_view_model.dart';

class IngredientNameTextFieldView extends ConsumerWidget {
  const IngredientNameTextFieldView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final vm = ref.read(createRefreginatorIngredientViewModelProvider.notifier);
    final selectedIngredient = ref.watch(
        createRefreginatorIngredientViewModelProvider
            .select((it) => it.selectedIngredient));
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
                onChanged: (value) =>
                    vm.onEvent(UpdateSelectedIngredientName(newName: value)),
                decoration: InputDecoration(
                  // 재료가 선택되면 선택한 기본재료의 이름이 hintLabel로 지정됨.
                  hintText: selectedIngredient?.name ?? "",
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
