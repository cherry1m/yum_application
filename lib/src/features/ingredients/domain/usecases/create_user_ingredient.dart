import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';

class CreateUserIngredientImpl extends CreateUserIngredient {
  final IngredientRepository _ingredientRepository;

  CreateUserIngredientImpl({
    required IngredientRepository ingredientRepository,
  }) : _ingredientRepository = ingredientRepository;

  @override
  Future<RefreginatorIngredient> call(RefreginatorIngredient ingredient) {
    return _ingredientRepository.createNewIngredient(ingredient);
  }
}

abstract class CreateUserIngredient {
  Future<RefreginatorIngredient> call(RefreginatorIngredient ingredient);
}
