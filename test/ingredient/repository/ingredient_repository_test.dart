import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/entity/entity.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';

import 'ingredient_repository_test.mocks.dart';

@GenerateMocks([RemoteDatasource])
void main() {
  late final RemoteDatasource remoteDatasource;
  late final IngredientRepositoryImpl ingredientRepository;
  group("Ingredient Repository Unit Test", () {
    setUpAll(() {
      remoteDatasource = MockRemoteDatasource();
      ingredientRepository =
          IngredientRepositoryImpl(remoteDatasource: remoteDatasource);
    });

    test("getAllIngredient 요청이 성공하면 List<Ingredient>가 반환된다", () async {
      when(remoteDatasource.getMyIngredient()).thenAnswer((_) async => [
            {
              "id": 1,
              "name": "egg",
              "isFreezed": false,
              "isFavorite": false,
              "category": "egg",
              "startAt": "2024-11-12",
              "endAt": "2024-11-17"
            }
          ]);
      final result = await ingredientRepository.getMyIngredient();
      verify(remoteDatasource.getMyIngredient()).called(1);
      expect(result, isA<List<RefreginatorIngredient>>());
      final first = result.first;
      expect(first.id, 1);
      expect(first.name, "egg");
      expect(first.isFreezed, false);
      expect(first.category, IngredientCategory.egg);
      expect(first.startAt, DateTime(2024, 11, 12));
      expect(first.endAt, DateTime(2024, 11, 17));
    });

    test("getAllIngredient 요청이 실패하면 에러 메시지가 반환된다.", () {
      when(remoteDatasource.getMyIngredient()).thenThrow("에러가 발생했습니다!");

      expect(
          () => ingredientRepository.getMyIngredient(), throwsA(isA<String>()));

      verify(remoteDatasource.getMyIngredient()).called(1);
    });

    test("createIngredient 요청이 성공하면 Ingredient가 반환된다", () async {
      final RefreginatorIngredient ingredient = RefreginatorIngredient(
          name: "egg",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 17));
      when(remoteDatasource.createNewIngredient(ingredient.toJson()))
          .thenAnswer((_) async => {
                "id": 1,
                "name": "egg",
                "isFreezed": false,
                "isFavorite": false,
                "category": "egg",
                "startAt": "2024-11-12",
                "endAt": "2024-11-17"
              });

      final result = await ingredientRepository.createNewIngredient(ingredient);
      verify(remoteDatasource.createNewIngredient(ingredient.toJson()))
          .called(1);
      expect(result, isA<RefreginatorIngredient>());
      expect(result.name, "egg");
      expect(result.isFreezed, false);
      expect(result.category, IngredientCategory.egg);
      expect(result.startAt, DateTime(2024, 11, 12));
      expect(result.endAt, DateTime(2024, 11, 17));
    });

    test("createIngredient 요청이 실패하면 에러 메시지가 반환된다", () {
      final RefreginatorIngredient ingredient = RefreginatorIngredient(
          name: "egg",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 17));
      when(remoteDatasource.createNewIngredient(ingredient.toJson()))
          .thenThrow("에러가 발생했습니다!");

      expect(() => ingredientRepository.createNewIngredient(ingredient),
          throwsA(isA<String>()));
    });

    test("updateIngredient 요청이 성공하면 Ingredient가 반환된다", () async {
      final RefreginatorIngredient ingredient = RefreginatorIngredient(
          name: "egg",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 17));
      when(remoteDatasource.updateIngredient(ingredient.toJson()))
          .thenAnswer((_) async => {
                "id": 1,
                "name": "egg",
                "isFreezed": false,
                "isFavorite": false,
                "category": "egg",
                "startAt": "2024-11-12",
                "endAt": "2024-11-17"
              });

      final result = await ingredientRepository.updateIngredient(ingredient);
      verify(remoteDatasource.updateIngredient(ingredient.toJson())).called(1);
      expect(result, isA<RefreginatorIngredient>());
      expect(result.name, "egg");
      expect(result.isFreezed, false);
      expect(result.category, IngredientCategory.egg);
      expect(result.startAt, DateTime(2024, 11, 12));
      expect(result.endAt, DateTime(2024, 11, 17));
    });

    test("updateIngredient 요청이 실패하면 에러 메시지가 반환된다", () {
      final RefreginatorIngredient ingredient = RefreginatorIngredient(
          name: "egg",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 17));
      when(remoteDatasource.updateIngredient(ingredient.toJson()))
          .thenThrow("에러가 발생했습니다!");

      expect(() => ingredientRepository.updateIngredient(ingredient),
          throwsA(isA<String>()));
    });

    test("deleteIngredient 요청이 성공하면 아무것도 반환하지 않는다.", () async {
      const id = 1;
      // final result = Future.value(true);
      when(remoteDatasource.deleteIngredient(id)).thenAnswer((_) async {});

      await ingredientRepository.deleteIngredient(1);

      verify(ingredientRepository.deleteIngredient(1)).called(1);
    });

    test("deleteIngredient 요청이 실패하면 아무것도 반환하지 않는다.", () async {
      const id = 1;
      // final result = Future.value(true);
      when(remoteDatasource.deleteIngredient(id)).thenThrow("에러가 발생했습니다!");

      expect(() => ingredientRepository.deleteIngredient(id),
          throwsA(isA<String>()));

      verify(ingredientRepository.deleteIngredient(1)).called(1);
    });

    test("getFavoriteIngredient 요청이 성공하면 List<IngredientCategory>가 반환된다.",
        () async {
      when(remoteDatasource.getMyFavoriteIngredient()).thenAnswer((_) async => [
            {"category": "beef"},
            {"category": "egg"},
          ]);

      final result = await ingredientRepository.getMyFavoriteIngredient();
      verify(remoteDatasource.getMyFavoriteIngredient()).called(1);
      expect(result.length, 2);
      expect(result[0], IngredientCategory.beef);
      expect(result[1], IngredientCategory.egg);
    });

    test("getFavoriteIngredient 요청이 실패하면 에러 메시지가 반환된다.", () async {
      when(remoteDatasource.getMyFavoriteIngredient()).thenThrow("에러가 발생했습니다");

      expect(() => ingredientRepository.getMyFavoriteIngredient(),
          throwsA(isA<String>()));
      verify(remoteDatasource.getMyFavoriteIngredient()).called(1);
    });

    test("createNewFavoriteIngredient 요청이 성공하면 void를 반환한다.", () async {
      const newFavorite = IngredientCategory.egg;
      when(remoteDatasource.createNewFavoriteIngredient(newFavorite.toJson()))
          .thenAnswer((_) async {});

      await ingredientRepository.createNewFavoriteIngredient(newFavorite);
      verify(remoteDatasource.createNewFavoriteIngredient(newFavorite.toJson()))
          .called(1);
    });

    test("createNewFavoriteIngredient 요청이 실패하면 void를 반환한다.", () async {
      const newFavorite = IngredientCategory.egg;
      when(remoteDatasource.createNewFavoriteIngredient(newFavorite.toJson()))
          .thenThrow("에러가 발생했습니다.");

      expect(
          () => ingredientRepository.createNewFavoriteIngredient(newFavorite),
          throwsA(isA<String>()));
      verify(remoteDatasource.createNewFavoriteIngredient(newFavorite.toJson()))
          .called(1);
    });

    test("deleteFavoriteIngredient 요청이 성공하면 void를 반환한다.", () async {
      const newFavorite = IngredientCategory.egg;
      when(remoteDatasource.deleteFavoriteIngredient(newFavorite.toJson()))
          .thenAnswer((_) async {});

      await ingredientRepository.deleteFavoriteIngredient(newFavorite);
      verify(remoteDatasource.deleteFavoriteIngredient(newFavorite.toJson()))
          .called(1);
    });

    test("createNewFavoriteIngredient 요청이 실패하면 void를 반환한다.", () async {
      const newFavorite = IngredientCategory.egg;
      when(remoteDatasource.deleteFavoriteIngredient(newFavorite.toJson()))
          .thenThrow("에러가 발생했습니다.");

      expect(() => ingredientRepository.deleteFavoriteIngredient(newFavorite),
          throwsA(isA<String>()));
      verify(remoteDatasource.deleteFavoriteIngredient(newFavorite.toJson()))
          .called(1);
    });
  });
}
