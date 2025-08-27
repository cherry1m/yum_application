import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/update_user_ingredient.dart';

import 'update_user_ingredient_test.mocks.dart';

@GenerateMocks([IngredientRepository])
void main() {
  late MockIngredientRepository mockIngredientRepository;
  late UpdateUserIngredientImpl useCase;

  setUp(() {
    mockIngredientRepository = MockIngredientRepository();
    useCase = UpdateUserIngredientImpl(
        ingredientRepository: mockIngredientRepository);
  });

  group(UpdateUserIngredient, () {
    test('should call repository updateIngredient with the given ingredient',
        () async {
      final ingredient = RefreginatorIngredient(
        id: 'id1',
        name: 'Carrot',
        category: IngredientCategory.cabbage,
        isFreezed: false,
        startAt: DateTime(2025, 8, 11),
        endAt: null,
      );

      when(mockIngredientRepository.updateIngredient(ingredient))
          .thenAnswer((_) async {
        return;
      });

      await useCase.call(ingredient);

      verify(mockIngredientRepository.updateIngredient(ingredient)).called(1);
    });
  });
}
