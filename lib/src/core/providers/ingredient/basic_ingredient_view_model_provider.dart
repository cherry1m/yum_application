import 'package:provider/provider.dart';
import 'package:yum_application/src/features/ingredients/data/repository/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/basic_ingredient_view_model.dart';

final baiscIngredientViewModelProvider =
    ChangeNotifierProvider<BasicIngredientViewModel>(
  create: (context) => BasicIngredientViewModel(
    ingredientRepository: context.read<IngredientRepository>(),
  ),
);
