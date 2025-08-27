import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/di/ingredient_di.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/ingredient_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/create_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/delete_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/get_user_ingredients.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/update_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_event.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_state.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_view_model.dart';

import 'refreginator_ingredient_list_view_model_test.mocks.dart';

@GenerateMocks([
  IngredientRepository,
  GetUserIngredients,
  CreateUserIngredient,
  DeleteUserIngredient,
  UpdateUserIngredient,
])
void main() {
  late ProviderContainer container;
  late MockIngredientRepository mockIngredientRepository;
  late MockGetUserIngredients mockGetUserIngredients;
  late MockCreateUserIngredient mockCreateUserIngredient;
  late MockDeleteUserIngredient mockDeleteUserIngredient;
  late MockUpdateUserIngredient mockUpdateUserIngredient;

  final sampleIngredient = RefreginatorIngredient(
    id: 'id1',
    name: 'Tomato',
    category: IngredientCategory.tomato,
    isFreezed: false,
    startAt: DateTime(2025, 8, 11),
    endAt: DateTime(2025, 8, 21),
  );

  setUp(() {
    mockIngredientRepository = MockIngredientRepository();
    mockGetUserIngredients = MockGetUserIngredients();
    mockCreateUserIngredient = MockCreateUserIngredient();
    mockDeleteUserIngredient = MockDeleteUserIngredient();
    mockUpdateUserIngredient = MockUpdateUserIngredient();

    container = ProviderContainer(
      overrides: [
        ingredientRepositoryProvider
            .overrideWithValue(mockIngredientRepository),
        getUserIngredientsProvider.overrideWithValue(mockGetUserIngredients),
        createUserIngredientProvider
            .overrideWithValue(mockCreateUserIngredient),
        deleteUserIngredientProvider
            .overrideWithValue(mockDeleteUserIngredient),
        updateUserIngredientProvider
            .overrideWithValue(mockUpdateUserIngredient),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group(RefreginatorIngredientListViewModel, () {
    test(
      'should have an empty initial state given the view model is first created when no data is loaded',
      () {
        when(mockGetUserIngredients.call()).thenAnswer((_) => Stream.value([]));
        final vm = container
            .read(refreginatorIngredientListViewModelProvider.notifier);
        final state =
            container.read(refreginatorIngredientListViewModelProvider);

        expect(state.ingredients, []);
        expect(state.status, RefreginatorIngredientListStatus.init);
      },
    );

    test(
      'should update state with repository data given ingredients exist when IngredientsLoad event is triggered',
      () async {
        when(mockGetUserIngredients.call())
            .thenAnswer((_) => Stream.value([sampleIngredient]));

        final vm = container
            .read(refreginatorIngredientListViewModelProvider.notifier);
        await vm.onEvent(IngredientsLoad());

        final state =
            container.read(refreginatorIngredientListViewModelProvider);
        expect(state.ingredients, [sampleIngredient]);
        expect(state.status, RefreginatorIngredientListStatus.success);
      },
    );

    test(
      'should add a new ingredient to the state given a valid ingredient when IngredientCreateRequest event is triggered',
      () async {
        when(mockGetUserIngredients.call())
            .thenAnswer((_) => const Stream.empty());
        when(mockCreateUserIngredient.call(any))
            .thenAnswer((_) async => sampleIngredient);
        when(mockUpdateUserIngredient.call(any)).thenAnswer((_) async {});
        when(mockDeleteUserIngredient.call(any)).thenAnswer((_) async {});

        final vm = container
            .read(refreginatorIngredientListViewModelProvider.notifier);
        await vm.onEvent(IngredientCreateReqeust(ingredient: sampleIngredient));

        final state =
            container.read(refreginatorIngredientListViewModelProvider);
        expect(state.ingredients.contains(sampleIngredient), true);
        verify(mockCreateUserIngredient.call(sampleIngredient)).called(1);
      },
    );

    test(
      'should remove the ingredient from the state given its ID when IngredientDeleteRequest event is triggered',
      () async {
        when(mockGetUserIngredients.call())
            .thenAnswer((_) => const Stream.empty());
        when(mockCreateUserIngredient.call(any))
            .thenAnswer((_) async => sampleIngredient);
        when(mockUpdateUserIngredient.call(any)).thenAnswer((_) async {});
        when(mockDeleteUserIngredient.call(any)).thenAnswer((_) async {});

        final vm = container
            .read(refreginatorIngredientListViewModelProvider.notifier);
        vm.state = vm.state.copyWith(ingredients: [sampleIngredient]);

        await vm.onEvent(IngredientDeleteRequest(id: sampleIngredient.id!));

        final state =
            container.read(refreginatorIngredientListViewModelProvider);
        expect(state.ingredients.any((ing) => ing.id == sampleIngredient.id),
            false);
        verify(mockDeleteUserIngredient.call(sampleIngredient.id!)).called(1);
      },
    );

    test(
      'should update the ingredient in the state given its ID matches when IngredientUpdateRequest event is triggered',
      () async {
        final updatedIngredient =
            sampleIngredient.copyWith(name: 'Updated Tomato');
        when(mockGetUserIngredients.call())
            .thenAnswer((_) => const Stream.empty());
        when(mockCreateUserIngredient.call(any))
            .thenAnswer((_) async => sampleIngredient);
        when(mockUpdateUserIngredient.call(any)).thenAnswer((_) async {});
        when(mockDeleteUserIngredient.call(any)).thenAnswer((_) async {});

        final vm = container
            .read(refreginatorIngredientListViewModelProvider.notifier);
        vm.state = vm.state.copyWith(ingredients: [sampleIngredient]);

        await vm
            .onEvent(IngredientUpdateRequest(ingredient: updatedIngredient));

        final state =
            container.read(refreginatorIngredientListViewModelProvider);
        expect(state.ingredients.first.name, 'Updated Tomato');
        verify(mockUpdateUserIngredient.call(updatedIngredient)).called(1);
      },
    );

    test(
      'should toggle warning filter flag given a boolean value when RefreginatorWarningFilterToggled event is triggered',
      () async {
        when(mockGetUserIngredients.call())
            .thenAnswer((_) => const Stream.empty());
        when(mockCreateUserIngredient.call(any))
            .thenAnswer((_) async => sampleIngredient);
        when(mockUpdateUserIngredient.call(any)).thenAnswer((_) async {});
        when(mockDeleteUserIngredient.call(any)).thenAnswer((_) async {});
        final vm = container
            .read(refreginatorIngredientListViewModelProvider.notifier);
        await vm.onEvent(RefreginatorWarningFilterToggled(isOn: true));

        final state =
            container.read(refreginatorIngredientListViewModelProvider);
        expect(state.isWarningFilterOn, true);
      },
    );

    test(
      'should set status to failure given repository throws an error when fetching ingredients',
      () async {
        when(mockGetUserIngredients.call())
            .thenAnswer((_) => Stream.error(Exception('Network error')));

        final vm = container
            .read(refreginatorIngredientListViewModelProvider.notifier);
        await vm.fetchData();

        final state =
            container.read(refreginatorIngredientListViewModelProvider);
        expect(state.status, RefreginatorIngredientListStatus.failure);
      },
    );
  });
}
