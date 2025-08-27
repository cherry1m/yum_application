import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/get_user_ingredients.dart';

import 'get_user_ingredients_test.mocks.dart';

@GenerateMocks([IngredientRepository])
void main() {
  late MockIngredientRepository mockIngredientRepository;
  late GetUserIngredientsImpl useCase;

  setUp(() {
    mockIngredientRepository = MockIngredientRepository();
    useCase = GetUserIngredientsImpl(
      ingredientRepository: mockIngredientRepository,
    );
  });

  group(GetUserIngredients, () {
    test('should fetch ingredients stream', () async {
      final ingredientList = <RefreginatorIngredient>[];

      // 레포지토리 스트림 반환 목 설정
      when(mockIngredientRepository.getMyIngredient())
          .thenAnswer((_) => Stream.value(ingredientList));

      // 테스트 실행
      final resultStream = useCase.call();

      // 첫번째 스트림 이벤트 가져오기
      final result = await resultStream.first;

      // 검증
      expect(result, ingredientList);
      verify(mockIngredientRepository.getMyIngredient()).called(1);
    });
  });
}
