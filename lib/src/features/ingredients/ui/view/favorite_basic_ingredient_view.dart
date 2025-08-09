import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/common/widgets/loading_progress_indicator.dart';
import 'package:yum_application/src/features/ingredients/ui/view/ingredient_grid_view.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/basic_ingredient_view_model.dart';

import '../../data/model/basic_ingredient_model.dart';

class FavoriteBasicIngredientView extends StatelessWidget {
  const FavoriteBasicIngredientView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicIngredientViewModel>();
    final state = viewModel.state;
    if (state is LoadingState) {
      return const Center(
        child: LoadingProgressIndicator(),
      );
    } else if (state is ErrorState) {
      return const Center(
        child: Text("즐겨찾기 목록을 불러올 수 없습니다."),
      );
    } else {
      return IngredientGridView(
          ingredients: (state as LoadedState).favorites, label: "즐겨찾기");
    }
  }
}
