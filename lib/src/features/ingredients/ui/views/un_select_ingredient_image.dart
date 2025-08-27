import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_event.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/views/basic_ingredient_bottom_sheet.dart';

class UnSelectIngredientImage extends ConsumerWidget {
  const UnSelectIngredientImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createIngredientVM =
        ref.read(createRefreginatorIngredientViewModelProvider.notifier);

    /// 사용자 기본 재료 선택 바텀 시트 함수
    void showIngredientAddBottomSheet() {
      showModalBottomSheet(
          backgroundColor: Colors.red,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32.0))),
          context: context,
          builder: (newContext) {
            return BasicIngredientBottomSheet(
              onItemTap: (ingredient) {
                createIngredientVM.onEvent(
                    SelectNewIngredientEvent(selectIngredient: ingredient));
                Navigator.of(context).pop();
              },
            );
          });
    }

    return GestureDetector(
        onTap: showIngredientAddBottomSheet,
        child: Text("+ 아이콘", style: Theme.of(context).textTheme.titleLarge));
  }
}
