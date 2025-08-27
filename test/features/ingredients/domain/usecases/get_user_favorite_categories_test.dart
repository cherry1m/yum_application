import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/get_user_favorite_categories.dart';

import 'get_user_favorite_categories_test.mocks.dart';

@GenerateMocks([FavoriteCategoryRepository])
void main() {
  group(GetUserFavoriteCategories, () {
    late MockFavoriteCategoryRepository mockFavoriteCategoryRepository;
    late GetUserFavoriteCategories usecase;

    setUp(() {
      mockFavoriteCategoryRepository = MockFavoriteCategoryRepository();
      usecase = GetUserFavoriteCategoriesImpl(
        favoriteCategoryRepository: mockFavoriteCategoryRepository,
      );
    });

    test('should return list of IngredientCategory from repository', () async {
      // given
      final expectedCategories = [
        IngredientCategory.tomato,
        IngredientCategory.grape,
      ];

      when(mockFavoriteCategoryRepository.getFavorites())
          .thenAnswer((_) async => expectedCategories);

      // when
      final result = await usecase();

      // then
      expect(result, expectedCategories);
      verify(mockFavoriteCategoryRepository.getFavorites()).called(1);
      verifyNoMoreInteractions(mockFavoriteCategoryRepository);
    });
  });
}
