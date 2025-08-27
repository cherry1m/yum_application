import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/create_favorite_category.dart';

import 'create_favorite_category_test.mocks.dart';

@GenerateMocks([FavoriteCategoryRepository])
void main() {
  group(CreateFavoriteCategory, () {
    late MockFavoriteCategoryRepository mockFavoriteCategoryRepository;
    late CreateFavoriteCategory usecase;

    setUp(() {
      mockFavoriteCategoryRepository = MockFavoriteCategoryRepository();
      usecase = CreateFavoriteCategoryImpl(
        favoriteCategoryRepository: mockFavoriteCategoryRepository,
      );
    });

    test('should create favorite category via repository', () async {
      // given
      const category = IngredientCategory.tomato;
      when(mockFavoriteCategoryRepository.createFavorite(category))
          .thenAnswer((_) async => category);

      // when
      final result = await usecase(category);

      // then
      expect(result, category);
      verify(mockFavoriteCategoryRepository.createFavorite(category)).called(1);
      verifyNoMoreInteractions(mockFavoriteCategoryRepository);
    });
  });
}
