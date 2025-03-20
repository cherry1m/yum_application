import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient_create_update_ui.dart';

class IngredientCreateUpdatePage extends StatelessWidget {
  const IngredientCreateUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewRefreginatorIngredientViewModel>(
      create: (context) => NewRefreginatorIngredientViewModel(),
      builder: (context, child) => const IngredientCreateUpdateUI(),
    );
  }
}
