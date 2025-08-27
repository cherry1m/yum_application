import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_event.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/widgets/single_button.dart';

class IngredientAddButtonView extends ConsumerWidget {
  const IngredientAddButtonView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refreginatorIngredientListVM =
        ref.read(refreginatorIngredientListViewModelProvider.notifier);
    final createRefreginatorIngredientState =
        ref.watch(createRefreginatorIngredientViewModelProvider);

    return SingleButton(
      enabled: createRefreginatorIngredientState.enabled,
      text: "등록하기",
      onTap: () async {
        final newIngredient =
            createRefreginatorIngredientState.toNewIngredient();
        refreginatorIngredientListVM
            .onEvent(IngredientCreateReqeust(ingredient: newIngredient));
        Navigator.of(context).pop();
      },
    );
  }
}
