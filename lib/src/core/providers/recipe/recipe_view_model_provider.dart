import 'package:provider/provider.dart';
import 'package:yum_application/src/data/recipe/repository/recipe_respository.dart';
import 'package:yum_application/src/ui/recipe/viewModel/recipe_view_model.dart';

final recipeViewModelProvider = ChangeNotifierProvider(
    create: (context) =>
        RecipeViewModel(recipeRepository: context.read<RecipeRepository>()));
