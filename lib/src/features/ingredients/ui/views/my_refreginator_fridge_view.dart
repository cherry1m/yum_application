import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/views/ingredient_edit_bottom_sheet.dart';
import 'package:yum_application/src/features/ingredients/ui/widgets/refreginator_container.dart';

class MyRefreginatorFridgeView extends ConsumerWidget {
  const MyRefreginatorFridgeView({super.key});

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

    final unfreezerItems = ref.watch(refreginatorIngredientListViewModelProvider
        .select((it) => it.myUnfreezedIngredientsAt(now)));
    return Padding(
        key: const Key("fridge"),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: RefreginatorContainer(
          label: "냉장 보관",
          rowCount: 3,
          children: unfreezerItems,
          onItemTap: (item) {
            showIngredientEditBottomSheet(item);
          },
        ));
  }
}
