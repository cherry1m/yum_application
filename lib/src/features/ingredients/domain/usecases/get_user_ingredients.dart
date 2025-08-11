import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_entity.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';

/// 사용자 냉장고 재료 조회 Usecase
class GetUserIngredientsImpl extends GetUserIngredients {
  final IngredientRepository _ingredientRepository;

  GetUserIngredientsImpl({
    required IngredientRepository ingredientRepository,
  }) : _ingredientRepository = ingredientRepository;
  @override
  Stream<List<RefreginatorIngredient>> call() {
    final ingredients = _ingredientRepository.getMyIngredient();
    return ingredients;
  }
}

abstract class GetUserIngredients {
  Stream<List<RefreginatorIngredient>> call();
}
