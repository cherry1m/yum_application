import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/domain/repositories/favorite_category_repository.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/delete_favorite_category.dart';

import 'delete_favorite_category_test.mocks.dart';

@GenerateMocks([FavoriteCategoryRepository])
void main() {
  group(DeleteFavoriteCategory, () {
    late MockFavoriteCategoryRepository mockFavoriteCategoryRepository;
    late DeleteFavoriteCategory usecase;

    setUp(() {
      mockFavoriteCategoryRepository = MockFavoriteCategoryRepository();
      usecase = DeleteFavoriteCategoryImpl(
        favoriteCategoryRepository: mockFavoriteCategoryRepository,
      );
    });

    test('should call repository.deleteFavorite with correct id', () async {
      // given
      const testId = 'test123';
      when(mockFavoriteCategoryRepository.deleteFavorite(testId))
          .thenAnswer((_) async {
        return;
      });

      // when
      await usecase(testId);

      // then
      verify(mockFavoriteCategoryRepository.deleteFavorite(testId)).called(1);
      verifyNoMoreInteractions(mockFavoriteCategoryRepository);
    });
  });
}
