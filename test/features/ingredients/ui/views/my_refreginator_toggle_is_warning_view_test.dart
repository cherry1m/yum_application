import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/features/ingredients/di/ingredient_di.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/create_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/delete_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/get_user_ingredients.dart';
import 'package:yum_application/src/features/ingredients/domain/usecases/update_user_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/views/my_refreginator_toggle_is_warning_view.dart';
import 'package:yum_application/src/features/ingredients/ui/widgets/ingredient_filter_check_box.dart';

import 'my_refreginator_toggle_is_warning_view_test.mocks.dart';

@GenerateMocks([
  GetUserIngredients,
  CreateUserIngredient,
  UpdateUserIngredient,
  DeleteUserIngredient,
  // RefreginatorIngredientListViewModel,
])
void main() {
  group(MyRefreginatorToggleIsWarningView, () {
    late MockGetUserIngredients mockGetUserIngredients;
    late MockCreateUserIngredient mockCreateUserIngredient;
    late MockUpdateUserIngredient mockUpdateUserIngredient;
    late MockDeleteUserIngredient mockDeleteUserIngredient;

    late Widget widget;

    setUp(() {
      mockGetUserIngredients = MockGetUserIngredients();
      mockCreateUserIngredient = MockCreateUserIngredient();
      mockUpdateUserIngredient = MockUpdateUserIngredient();
      mockDeleteUserIngredient = MockDeleteUserIngredient();

      widget = MaterialApp(
          home: ProviderScope(overrides: [
        getUserIngredientsProvider.overrideWithValue(mockGetUserIngredients),
        createUserIngredientProvider
            .overrideWithValue(mockCreateUserIngredient),
        updateUserIngredientProvider
            .overrideWithValue(mockUpdateUserIngredient),
        deleteUserIngredientProvider
            .overrideWithValue(mockDeleteUserIngredient),
        // refreginatorIngredientListViewModelProvider
        //     .overrideWith(MockRefreginatorIngredientListViewModel.new)
      ], child: const Scaffold(body: MyRefreginatorToggleIsWarningView())));
    });

    testWidgets('should render correctly MyRefreginatorToggleIsWarningView()',
        (tester) async {
      when(mockGetUserIngredients.call()).thenAnswer((_) => Stream.value([]));
      // when()
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('기간 임박'), findsOneWidget);

      await expectLater(
        find.byType(MyRefreginatorToggleIsWarningView),
        matchesGoldenFile(
            'goldens/my_refreginator_toggle_is_warning_default.png'),
      );
    });

    testWidgets('should render warning ingredients when isWarning is true',
        (tester) async {
      when(mockGetUserIngredients.call()).thenAnswer((_) => Stream.value([]));
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('기간 임박'), findsOneWidget);
      final checkbox = find.byType(IngredientFilterCheckBox);

      await tester.tap(checkbox);
      await tester.pumpAndSettle();
      expect(tester.widget<IngredientFilterCheckBox>(checkbox).value, true);

      await expectLater(
        find.byType(MyRefreginatorToggleIsWarningView),
        matchesGoldenFile('goldens/my_refreginator_toggle_is_warning_on.png'),
      );
    });
  });
}
