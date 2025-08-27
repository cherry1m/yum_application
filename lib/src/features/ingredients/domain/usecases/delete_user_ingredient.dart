import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';

class DeleteUserIngredientImpl extends DeleteUserIngredient {
  final IngredientRepository _ingredientRepository;

  DeleteUserIngredientImpl({
    required IngredientRepository ingredientRepository,
  }) : _ingredientRepository = ingredientRepository;

  @override
  Future<void> call(String id) {
    return _ingredientRepository.deleteIngredient(id);
  }
}

abstract class DeleteUserIngredient {
  Future<void> call(String id);
}
