import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/delete_user_ingredient.dart';

import 'delete_user_ingredient_test.mocks.dart';

@GenerateMocks([IngredientRepository])
void main() {
  late MockIngredientRepository mockIngredientRepository;
  late DeleteUserIngredientImpl useCase;

  group(DeleteUserIngredient, () {
    setUp(() {
      mockIngredientRepository = MockIngredientRepository();
      useCase = DeleteUserIngredientImpl(
          ingredientRepository: mockIngredientRepository);
    });

    test('should call repository deleteIngredient with correct id', () async {
      const testId = 'ingredient123';

      when(mockIngredientRepository.deleteIngredient(testId))
          .thenAnswer((_) async {
        return;
      });

      await useCase.call(testId);

      verify(mockIngredientRepository.deleteIngredient(testId)).called(1);
    });
  });
}
