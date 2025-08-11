import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/refreginator_ingredient_list_model.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/refreginator_ingredient_list_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/widget/refreginator_container.dart';

class MyRefreginatorFreezerView extends ConsumerWidget {
  const MyRefreginatorFreezerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel =
        ref.read(refreginatorIngredientViewModelProvider.notifier);
    final state =
        ref.watch(refreginatorIngredientViewModelProvider) as LoadedState;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: RefreginatorContainer(
            label: "냉동 보관", children: state.myFreezedIngredients));
  }
}
