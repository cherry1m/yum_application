import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/model/model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/refreginator_ingredient_view_model.dart';

import 'ingredient_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepositoryImpl>()])
main() {
  late final MockIngredientRepositoryImpl ingredientRepository;
  late final RefreginatorIngredientViewModel ingredientViewModel;

  final freezedIngredients = [
    RefreginatorIngredient(
      id: 1,
      name: "egg",
      category: IngredientCategory.egg,
      isFreezed: true,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
    RefreginatorIngredient(
      id: 2,
      name: "beef",
      category: IngredientCategory.beef,
      isFreezed: true,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
    RefreginatorIngredient(
      id: 3,
      name: "bread",
      category: IngredientCategory.bread,
      isFreezed: true,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
  ];

  final unfreezedIngredients = [
    RefreginatorIngredient(
      id: 4,
      name: "beef",
      category: IngredientCategory.beef,
      isFreezed: false,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
    RefreginatorIngredient(
      id: 5,
      name: "bread",
      category: IngredientCategory.bread,
      isFreezed: false,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
  ];

  group("Ingredient View Model Unit Test", () {
    setUpAll(() {
      ingredientRepository = MockIngredientRepositoryImpl();
      when(ingredientRepository.getMyIngredient()).thenAnswer(
          (_) async => [...freezedIngredients, ...unfreezedIngredients]);
      ingredientViewModel = RefreginatorIngredientViewModel(
          ingredientRepository: ingredientRepository);

      verify(ingredientRepository.getMyIngredient()).called(1);

      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test("fetchData 실패 테스트", () {
      when(ingredientRepository.getMyIngredient()).thenThrow(Exception("에러"));

      expect(() async => ingredientViewModel.fetchData(), throwsException);
    });

    test("selectIngredient메소드를 이용해서 새로운 재료를 생성할 수 있다.", () {
      final newIngredient = BasicIngredient(
        name: "egg",
        category: IngredientCategory.egg,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      final selectIngredient = ingredientViewModel.selectedIngredient!;
      expect(selectIngredient.name, "egg");
      expect(selectIngredient.category, IngredientCategory.egg);
      expect(selectIngredient.isFreezed, false);
    });

    test("toggleIsFreezed메소드를 이용해서 재료의 냉장 냉동 여부를 바꿀 수 있다.", () {
      final newIngredient = BasicIngredient(
        name: "egg",
        category: IngredientCategory.egg,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      ingredientViewModel.toggleIsFreezed(true);
      expect(ingredientViewModel.selectedIngredient!.isFreezed, true);
    });

    test("updateStartAt 메소드로 구매날짜를 갱신할 수 있다.", () {
      final newIngredient = BasicIngredient(
        name: "egg",
        category: IngredientCategory.egg,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      ingredientViewModel.updateStartAt(DateTime(2024, 12, 3));
      expect(ingredientViewModel.selectedIngredient!.startAt,
          DateTime(2024, 12, 3));
    });

    test("updateEndAt 메소드로 소비날짜를 갱신할 수 있다.", () {
      final newIngredient = BasicIngredient(
        name: "egg",
        category: IngredientCategory.egg,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      ingredientViewModel.updateEndAt(DateTime(2024, 12, 30));
      expect(ingredientViewModel.selectedIngredient!.endAt,
          DateTime(2024, 12, 30));
    });
  });
}
