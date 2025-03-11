import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/basic_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/refreginator_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/basic_ingredient_view_model.dart';

import 'basic_ingredient_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepository>()])
void main() {
  late IngredientRepository ingredientRepository;
  late BasicIngredientViewModel viewModel;

  setUp(() {
    ingredientRepository = MockIngredientRepository();
    viewModel =
        BasicIngredientViewModel(ingredientRepository: ingredientRepository);
    expect(viewModel.state is LoadingState, true);
  });

  group("BasicIngredientViewModel Unit Test", () {
    test("viewModel은 생성 시 서버로부터 즐겨찾기 데이터를 가져온다.", () async {
      final mockFavorites = [
        IngredientCategory.beef,
        IngredientCategory.egg,
      ];

      when(ingredientRepository.getMyFavoriteIngredient())
          .thenAnswer((_) async => mockFavorites);
      await viewModel.fetchData();
      expect(viewModel.state is LoadedState, true);
      expect(
          (viewModel.state as LoadedState)
              .categories
              .contains(IngredientCategory.beef),
          true);
      expect(
          (viewModel.state as LoadedState)
              .categories
              .contains(IngredientCategory.egg),
          true);

      expect((viewModel.state as LoadedState).favorites.length, 2);
    });

    test("viewModel은 toggleIsFavorite을 통해서 새로운 즐겨찾기 재료를 추가할 수 있다.", () async {
      viewModel.fetchData();
      const category = IngredientCategory.egg;
      final prevState = viewModel.state as LoadedState;
      expect(prevState.categories.length, 0);
      viewModel.toggleIsFavorite(category);

      final currState = viewModel.state as LoadedState;
      expect(currState.favorites.length, prevState.categories.length + 1);
      expect(currState.categories.contains(category), true);
    });

    test("viewModel은 toggleIsFavorite을 통해서 기존의 즐겨찾기 재료를 삭제할 수 있다.", () async {
      const category = IngredientCategory.beef;
      when(ingredientRepository.getMyFavoriteIngredient())
          .thenAnswer((_) async => [category]);
      await viewModel.fetchData();
      final prevState = viewModel.state as LoadedState;
      expect(prevState.categories.length, 1);
      expect(prevState.categories.contains(category), true);

      viewModel.toggleIsFavorite(category);
      final currState = viewModel.state as LoadedState;
      expect(currState.categories.length, prevState.categories.length - 1);
      expect(currState.categories.contains(category), false);
    });

    test("viewModel은 즐겨찾기 재료 추가시 서버에게 새로운 재료 생성을 요청한다.", () {
      const category = IngredientCategory.egg;
      viewModel.createNewFavoriteIngredient(category);

      verify(ingredientRepository.createNewFavoriteIngredient(category))
          .called(1);
    });

    test("viewModel은 즐겨찾기 재료 삭제시 서버에게 기존 재료 삭제를 요청한다.", () {
      const category = IngredientCategory.egg;
      viewModel.deleteFavoriteIngredient(category);

      verify(ingredientRepository.deleteFavoriteIngredient(category)).called(1);
    });

    test("viewModel은 fetchDate()에서 통신 에러시 ErrorState로 갱신된다.", () async {
      when(ingredientRepository.getMyFavoriteIngredient())
          .thenThrow(Exception("서버 통신 에러"));

      await viewModel.fetchData();

      expect(viewModel.state is ErrorState, true);
    });

    test("viewModel은 ToggleIsFavorite 이벤트를 통해서 기존 즐겨찾기 재료를 삭제할 수 있다.",
        () async {
      final mockFavorites = [
        IngredientCategory.beef,
        IngredientCategory.egg,
      ];

      when(ingredientRepository.getMyFavoriteIngredient())
          .thenAnswer((_) async => mockFavorites);
      await viewModel.fetchData();
      final prevState = viewModel.state as LoadedState;
      expect(prevState.categories.length, 2);
      expect(prevState.categories.contains(IngredientCategory.beef), true);
      expect(prevState.categories.contains(IngredientCategory.egg), true);

      final event = ToggleIsFavorite(category: IngredientCategory.beef);
      viewModel.onEvent(event);
      final currState = viewModel.state as LoadedState;
      expect(currState.categories.length, 1);
      expect(currState.categories.contains(IngredientCategory.beef), false);
      expect(currState.categories.contains(IngredientCategory.egg), true);
    });

    test("viewModel은 ToggleIsFavorite 이벤트를 통해서 즐겨찾기 재료를 추가할 수 있다.", () async {
      final mockFavorites = [
        IngredientCategory.beef,
        IngredientCategory.egg,
      ];

      when(ingredientRepository.getMyFavoriteIngredient())
          .thenAnswer((_) async => mockFavorites);
      await viewModel.fetchData();
      final prevState = viewModel.state as LoadedState;
      expect(prevState.categories.length, 2);
      expect(prevState.categories.contains(IngredientCategory.beef), true);
      expect(prevState.categories.contains(IngredientCategory.egg), true);

      final event = ToggleIsFavorite(category: IngredientCategory.beer);
      viewModel.onEvent(event);
      final currState = viewModel.state as LoadedState;
      expect(currState.categories.length, 3);
      expect(currState.categories.contains(IngredientCategory.beef), true);
      expect(currState.categories.contains(IngredientCategory.egg), true);
      expect(currState.categories.contains(IngredientCategory.beer), true);
    });
  });
}
