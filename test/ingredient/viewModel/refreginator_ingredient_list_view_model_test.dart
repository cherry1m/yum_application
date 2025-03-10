import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/refreginator_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/refreginator_ingredient_list_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/refreginator_ingredient_view_model.dart';

import 'refreginator_ingredient_list_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepository>()])
void main() {
  late IngredientRepository ingredientRepository;
  late RefreginatorIngredientViewModel viewModel;
  group("Refreginator Ingredient List View Model Unit Test", () {
    setUp(() {
      ingredientRepository = MockIngredientRepository();
      viewModel = RefreginatorIngredientViewModel(
          ingredientRepository: ingredientRepository);
      expect(viewModel.state is LoadingState, true);
    });

    test("viewModel은 생성 시 서버로부터 사용자 재료를 가져온다.", () async {
      final mockIngredients = [
        RefreginatorIngredient(
            id: 1,
            name: "달걀",
            category: IngredientCategory.egg,
            isFreezed: false,
            startAt: DateTime(2024, 11, 19),
            endAt: DateTime(2024, 11, 30)),
        RefreginatorIngredient(
            id: 2,
            name: "고기",
            category: IngredientCategory.beef,
            isFreezed: true,
            startAt: DateTime(2024, 11, 19),
            endAt: null),
      ];
      when(ingredientRepository.getMyIngredient())
          .thenAnswer((_) async => mockIngredients);

      await viewModel.fetchData();

      verify(ingredientRepository.getMyIngredient()).called(2);

      expect(viewModel.state is LoadedState, true);
      final currState = viewModel.state as LoadedState;
      expect(currState.ingredients.length, 2);
      expect(currState.ingredients[0].name, "달걀");
      expect(currState.ingredients[1].name, "고기");
    });

    test("viewModel은 새로운 재료를 추가할 수 있다.", () async {
      final newIngredient = RefreginatorIngredient(
          id: 1,
          name: "달걀",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 19),
          endAt: DateTime(2024, 11, 30));
      provideDummy(newIngredient);
      when(ingredientRepository.getMyIngredient()).thenAnswer((_) async => []);
      await viewModel.fetchData();
      final prevState = viewModel.state as LoadedState;
      when(ingredientRepository.createNewIngredient(newIngredient))
          .thenAnswer((_) async => newIngredient);
      await viewModel.createNewIngredient(newIngredient);

      verify(ingredientRepository.createNewIngredient(newIngredient)).called(1);

      final currState = viewModel.state as LoadedState;
      expect(currState.ingredients.length, prevState.ingredients.length + 1);
    });

    test("viewModel은 기존 재료를 업데이트 할 수 있다.", () async {
      final oldIngredient = RefreginatorIngredient(
          id: 1,
          name: "달걀",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 19),
          endAt: DateTime(2024, 11, 30));
      final mockIngredients = [
        oldIngredient,
        RefreginatorIngredient(
            id: 2,
            name: "고기",
            category: IngredientCategory.beef,
            isFreezed: true,
            startAt: DateTime(2024, 11, 19),
            endAt: null),
      ];

      when(ingredientRepository.getMyIngredient())
          .thenAnswer((_) async => mockIngredients);

      await viewModel.fetchData();

      final prevState = viewModel.state as LoadedState;
      expect(prevState.ingredients[0], oldIngredient);

      verify(ingredientRepository.getMyIngredient()).called(2);

      final updateIngredient = RefreginatorIngredient(
          id: 1,
          name: "갱신된 달걀",
          category: IngredientCategory.beef,
          isFreezed: true,
          startAt: DateTime(2024, 11, 21),
          endAt: null);
      provideDummy(updateIngredient);
      when(ingredientRepository.updateIngredient(updateIngredient))
          .thenAnswer((_) async => updateIngredient);
      await viewModel.updateIngredient(updateIngredient);
      final currState = viewModel.state as LoadedState;

      expect(currState.ingredients.length, prevState.ingredients.length);
      expect(currState.ingredients[0], updateIngredient);
    });

    test("viewModel은 기존 재료를 삭제할 수 있다.", () async {
      final oldIngredient = RefreginatorIngredient(
          id: 1,
          name: "달걀",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 19),
          endAt: DateTime(2024, 11, 30));
      final mockIngredients = [
        oldIngredient,
        RefreginatorIngredient(
            id: 2,
            name: "고기",
            category: IngredientCategory.beef,
            isFreezed: true,
            startAt: DateTime(2024, 11, 19),
            endAt: null),
      ];

      when(ingredientRepository.getMyIngredient())
          .thenAnswer((_) async => mockIngredients);

      await viewModel.fetchData();

      final prevState = viewModel.state as LoadedState;
      expect(prevState.ingredients[0], oldIngredient);

      when(ingredientRepository.deleteIngredient(oldIngredient.id!))
          .thenAnswer((_) async {});

      await viewModel.deleteIngredient(oldIngredient);

      verify(ingredientRepository.deleteIngredient(oldIngredient.id!))
          .called(1);

      final currState = viewModel.state as LoadedState;

      expect(currState.ingredients.length, prevState.ingredients.length - 1);
    });
  });
}
