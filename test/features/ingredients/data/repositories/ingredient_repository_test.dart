import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_ingredient_api.dart';
import 'package:yum_application/src/features/ingredients/data/model/ingredient.dart';
import 'package:yum_application/src/features/ingredients/data/repository/ingredient_repository_impl.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';

import 'ingredient_repository_test.mocks.dart';

@GenerateMocks([
  RemoteIngredientApi,
])
void main() {
  group(IngredientRepository, () {
    late MockRemoteIngredientApi remoteIngredientApi;
    late IngredientRepository ingredientRepository;

    setUp(() {
      remoteIngredientApi = MockRemoteIngredientApi();
      ingredientRepository =
          IngredientRepositoryImpl(remoteDatasource: remoteIngredientApi);
    });

    test('getMyIngredient should map Ingredient to IngredientEntity stream',
        () async {
      // given
      final ingredientList = [
        Ingredient(
          id: 'id1',
          name: 'Tomato',
          category: 'tomato',
          isFreezed: false,
          startAt: DateTime(2025, 8, 11),
          endAt: DateTime(2025, 8, 21),
        ),
        Ingredient(
          id: 'id2',
          name: 'Apple',
          category: 'grape',
          isFreezed: true,
          startAt: DateTime(2025, 7, 10),
          endAt: null,
        ),
      ];

      when(remoteIngredientApi.getMyIngredient())
          .thenAnswer((_) => Stream.value(ingredientList));

      // when
      final stream = ingredientRepository.getMyIngredient();

      // then
      expect(
        await stream.first,
        [
          RefreginatorIngredient.fromResponse(ingredientList[0]),
          RefreginatorIngredient.fromResponse(ingredientList[1]),
        ],
      );

      verify(remoteIngredientApi.getMyIngredient()).called(1);
    });

    test('createNewIngredient returns ingredient with generated id', () async {
      final newIngredient = RefreginatorIngredient(
          id: null, // 생성 전에는 id가 없는 상태
          name: 'Apple',
          category: IngredientCategory.grape,
          isFreezed: false,
          startAt: DateTime(2025, 8, 11),
          endAt: DateTime(2025, 8, 21));

      final response = Ingredient(
        id: 'uuid',
        name: 'Apple',
        category: 'grape',
        isFreezed: false,
        startAt: DateTime(2025, 8, 11),
        endAt: DateTime(2025, 8, 21),
      );
      provideDummy(response);
      when(remoteIngredientApi.createNewIngredient(argThat(
              predicate<Ingredient>(
                  (ing) => ing.name == 'Apple' && ing.category == 'grape'))))
          .thenAnswer((_) async => response);

      final result =
          await ingredientRepository.createNewIngredient(newIngredient);

      verify(remoteIngredientApi.createNewIngredient(any)).called(1);
      expect(result.id, 'uuid');
      expect(result.name, 'Apple');
      expect(result.category, IngredientCategory.grape);
      expect(result.startAt, DateTime(2025, 8, 11));
      expect(result.endAt, DateTime(2025, 8, 21));
    });

    test('should call remoteDatasource.deleteIngredient with correct id',
        () async {
      const testId = 'test123';

      when(remoteIngredientApi.deleteIngredient(testId)).thenAnswer((_) async {
        return;
      });

      await ingredientRepository.deleteIngredient(testId);

      verify(remoteIngredientApi.deleteIngredient(testId)).called(1);
    });

    test(
        'should call remoteDatasource.updateIngredient with converted Ingredient',
        () async {
      final entity = RefreginatorIngredient(
        id: 'id1',
        name: 'Carrot',
        category: IngredientCategory.cabbage, // 예시로 vegetable이 있다고 가정
        isFreezed: false,
        startAt: DateTime(2025, 8, 11),
        endAt: null,
      );

      when(remoteIngredientApi.updateIngredient(any)).thenAnswer((_) async {
        return;
      });

      await ingredientRepository.updateIngredient(entity);

      verify(remoteIngredientApi.updateIngredient(argThat(
        predicate((Ingredient arg) =>
            arg.name == entity.name &&
            arg.category == entity.category.name &&
            arg.isFreezed == entity.isFreezed),
      ))).called(1);
    });
  });
}
