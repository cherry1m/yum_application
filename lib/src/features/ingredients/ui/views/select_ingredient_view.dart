import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/views/select_ingredient_image.dart';
import 'package:yum_application/src/features/ingredients/ui/views/un_select_ingredient_image.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_view_model.dart';

/// 선택한 재료가 있는 경우
///
/// 현재 선택된 재료 이미지를 볼 수 있음.
class SelectIngredientView extends ConsumerWidget {
  const SelectIngredientView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createRefreginatorIngredientViewModelProvider);

    return switch (state.selectedIngredient) {
      BasicIngredient() => SelectIngredientImage(
          ingredient: state.selectedIngredient!,
          width: 250,
        ),
      _ => const UnSelectIngredientImage(),
    };
  }
}
