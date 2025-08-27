import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/create_user_ingredient.dart';
import 'create_user_ingredient_test.mocks.dart';

@GenerateMocks([IngredientRepository])
void main() {
  late MockIngredientRepository mockIngredientRepository;
  late CreateUserIngredientImpl useCase;

  setUp(() {
    mockIngredientRepository = MockIngredientRepository();
    useCase = CreateUserIngredientImpl(
        ingredientRepository: mockIngredientRepository);
  });
  group(CreateUserIngredient, () {
    test(
        'should create new ingredient by calling repository and return the entity',
        () async {
      final ingredient = RefreginatorIngredient(
        id: 'uuid',
        name: 'Carrot',
        category: IngredientCategory.cabbage,
        isFreezed: false,
        startAt: DateTime(2025, 8, 11),
        endAt: null,
      );

      when(mockIngredientRepository.createNewIngredient(ingredient))
          .thenAnswer((_) async => ingredient);

      final result = await useCase.call(ingredient);

      expect(result, ingredient);
      verify(mockIngredientRepository.createNewIngredient(ingredient))
          .called(1);
    });
  });
}
