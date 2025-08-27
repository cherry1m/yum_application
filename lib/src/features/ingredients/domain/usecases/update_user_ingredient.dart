import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';

class UpdateUserIngredientImpl extends UpdateUserIngredient {
  final IngredientRepository _ingredientRepository;
  UpdateUserIngredientImpl({
    required IngredientRepository ingredientRepository,
  }) : _ingredientRepository = ingredientRepository;

  @override
  Future<void> call(RefreginatorIngredient ingredient) {
    return _ingredientRepository.updateIngredient(ingredient);
  }
}

abstract class UpdateUserIngredient {
  Future<void> call(RefreginatorIngredient ingredient);
}
