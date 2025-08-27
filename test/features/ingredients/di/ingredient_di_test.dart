import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/core/di/app_provider.dart';
import 'package:yum_application/src/features/ingredients/di/ingredient_di.dart';

import 'ingredient_di_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
])
void main() {
  group('ingredient di test', () {
    late ProviderContainer container;
    late MockFirebaseFirestore firebaseFireStore;
    setUp(() {
      firebaseFireStore = MockFirebaseFirestore();
      container = ProviderContainer(overrides: [
        firebaseFirestoreProvider.overrideWithValue(firebaseFireStore),
      ]);
    });

    tearDown(() {
      container.dispose();
    });

    test('remoteIngredientApiProvider returns RemoteIngredientApi instance',
        () {
      final api = container.read(remoteIngredientApiProvider);
      expect(api, isNotNull);
      // 타입 검증, RemoteIngredientApi 임포트 되어 있어야 함
      expect(api.runtimeType.toString(), contains('RemoteIngredientApi'));
    });

    test(
        'ingredientRepositoryProvider returns IngredientRepositoryImpl instance',
        () {
      final repository = container.read(ingredientRepositoryProvider);
      expect(repository, isNotNull);
      expect(repository.runtimeType.toString(),
          contains('IngredientRepositoryImpl'));
    });

    test('getUserIngredientsProvider returns GetUserIngredientsImpl instance',
        () {
      final usecase = container.read(getUserIngredientsProvider);
      expect(usecase, isNotNull);
      expect(
          usecase.runtimeType.toString(), contains('GetUserIngredientsImpl'));
    });

    test(
        'createUserIngredientProvider returns CreateUserIngredientImpl instance',
        () {
      final usecase = container.read(createUserIngredientProvider);
      expect(usecase, isNotNull);
      expect(
          usecase.runtimeType.toString(), contains('CreateUserIngredientImpl'));
    });

    test(
        'deleteUserIngredientProvider returns DeleteUserIngredientImpl instance',
        () {
      final usecase = container.read(deleteUserIngredientProvider);
      expect(usecase, isNotNull);
      expect(
          usecase.runtimeType.toString(), contains('DeleteUserIngredientImpl'));
    });

    test(
        'updateUserIngredientProvider returns UpdateUserIngredientImpl instance',
        () {
      final usecase = container.read(updateUserIngredientProvider);
      expect(usecase, isNotNull);
      expect(
          usecase.runtimeType.toString(), contains('UpdateUserIngredientImpl'));
    });
  });
}
