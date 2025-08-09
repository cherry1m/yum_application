import 'package:provider/provider.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/new_refreginator_ingredient_view_model.dart';

final newRefreginatorIngredientViewModelProvider =
    ChangeNotifierProvider<NewRefreginatorIngredientViewModel>(
  create: (context) => NewRefreginatorIngredientViewModel(),
);
