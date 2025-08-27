import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/data/datasource/remotes/remote_favorite_category_api.dart';
import 'package:yum_application/src/features/ingredients/data/model/favorite_category.dart';
import 'package:yum_application/src/features/ingredients/data/repository/favorite_category_repository_impl.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';

import 'favorite_category_repository_test.mocks.dart';

@GenerateMocks([
  RemoteFavoriteCategoryApi,
])
void main() {
  group(FavoriteCategoryRepository, () {
    late MockRemoteFavoriteCategoryApi mockRemoteFavoriteCategoryApi;
    late FavoriteCategoryRepository favoriteCategoryRepository;

    setUp(() {
      mockRemoteFavoriteCategoryApi = MockRemoteFavoriteCategoryApi();
      favoriteCategoryRepository = FavoriteCategoryRepositoryImpl(
        remoteDatasource: mockRemoteFavoriteCategoryApi,
      );
    });

    test('getFavorites should map remote categories to IngredientCategory list',
        () async {
      // given
      final remoteResponse = [
        // category 필드만 있는 DTO 가정
        const FavoriteCategory(id: 'uuid1', category: 'tomato'),
        const FavoriteCategory(id: 'uuid1', category: 'grape'),
      ];

      when(mockRemoteFavoriteCategoryApi.getFavorites())
          .thenAnswer((_) async => remoteResponse);

      // when
      final result = await favoriteCategoryRepository.getFavorites();

      // then
      expect(result, [
        IngredientCategory.tomato,
        IngredientCategory.grape,
      ]);
      verify(mockRemoteFavoriteCategoryApi.getFavorites()).called(1);
    });

    test('createFavorite should map created remote category to entity',
        () async {
      // given
      const category = IngredientCategory.tomato;
      const remoteResponse = FavoriteCategory(id: 'uuid', category: 'tomato');

      when(mockRemoteFavoriteCategoryApi.createFavorite(any))
          .thenAnswer((_) async => remoteResponse);

      // when
      final result = await favoriteCategoryRepository.createFavorite(category);

      // then
      expect(result, IngredientCategory.tomato);
      verify(mockRemoteFavoriteCategoryApi
              .createFavorite(category.toFavorite()))
          .called(1);
    });

    test('deleteFavorite should call remoteDatasource.deleteFavorite',
        () async {
      // given
      const testId = 'test123';
      when(mockRemoteFavoriteCategoryApi.deleteFavorite(testId))
          .thenAnswer((_) async {
        return;
      });

      // when
      await favoriteCategoryRepository.deleteFavorite(testId);

      // then
      verify(mockRemoteFavoriteCategoryApi.deleteFavorite(testId)).called(1);
    });
  });
}
