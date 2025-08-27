import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/basic_ingredient_list_state.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/basic_ingredient_list_view_model.dart';
import 'package:yum_application/src/ui/common/widgets/loading_progress_indicator.dart';
import 'package:yum_application/src/features/ingredients/ui/views/ingredient_grid_view.dart';

class FavoriteBasicIngredientView extends ConsumerWidget {
  final ValueSetter<BasicIngredient>? onItemTap;
  const FavoriteBasicIngredientView({
    super.key,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basicIngredientListState =
        ref.watch(basicIngredientListViewModelProvider);

    return switch (basicIngredientListState.status) {
      BasicIngredientListStatus.loading => const Center(
          child: LoadingProgressIndicator(),
        ),
      BasicIngredientListStatus.done =>
        basicIngredientListState.favorites.isNotEmpty
            ? BasicIngredientGridView(
                ingredients: basicIngredientListState.getFavorites(),
                label: "즐겨찾기",
                onItemTap: onItemTap,
              )
            : Container(),
      BasicIngredientListStatus.error => const Center(
          child: Text("즐겨찾기 목록을 불러올 수 없습니다."),
        ),
    };
  }
}
