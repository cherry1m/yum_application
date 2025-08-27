import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/views/ingredient_edit_bottom_sheet.dart';
import 'package:yum_application/src/features/ingredients/ui/widgets/refreginator_container.dart';

class MyRefreginatorFreezerView extends ConsumerWidget {
  const MyRefreginatorFreezerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    void showIngredientEditBottomSheet(RefreginatorIngredient item) {
      showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32.0))),
          context: context,
          builder: (context) => IngredientEditBottomSheet(
                ingredient: item,
              ));
    }

    final freezerItems = ref.watch(refreginatorIngredientListViewModelProvider
        .select((it) => it.myFreezedIngredientsAt(now)));

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: RefreginatorContainer(
          label: "냉동 보관",
          children: freezerItems,
          onItemTap: (item) {
            showIngredientEditBottomSheet(item);
          },
        ));
  }
}
