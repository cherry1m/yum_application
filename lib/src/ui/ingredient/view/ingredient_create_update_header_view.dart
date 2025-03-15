import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_state.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';

class IngredientCreateUpdateHeaderView extends StatelessWidget {
  const IngredientCreateUpdateHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = context.read<NewRefreginatorIngredientViewModel>();
    final state = viewModel.state;
    return Text(
      switch (state.type) {
        SelectType.create => "새로운 식재료",
        SelectType.update => "식재료 수정하기",
      },
      style: theme.textTheme.headlineLarge,
    );
  }
}
