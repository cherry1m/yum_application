import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/refreginator_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';

void main() {
  late NewRefreginatorIngredientViewModel viewModel;

  setUp(() {
    viewModel = NewRefreginatorIngredientViewModel();
  });
  group("New Refreginator Ingredient View Model Unit Test", () {
    test("초기 생성 재료는 비어있다.", () {
      expect(viewModel.state.selectedIngredient, null);
    });

    test("SelectNewIngredient Event를 통해서 새로운 재료를 선택할 수 있다.", () {
      final selectIngredient =
          BasicIngredient(name: "egg", category: IngredientCategory.egg);
      final event =
          SelectNewIngredientEvent(selectIngredient: selectIngredient);
      viewModel.onEvent(event);
      expect(viewModel.state.selectedIngredient, selectIngredient);
      expect(viewModel.state.name, "");
      expect(viewModel.state.id, null);
      expect(viewModel.state.isFreezed, false);
      expect(viewModel.state.isINF, false);
      final now = DateTime.now();
      final startAt = viewModel.state.startAt;
      expect(startAt.year, now.year);
      expect(startAt.month, now.month);
      expect(startAt.day, now.day);
      final endAt = viewModel.state.endAt!;
      expect(endAt.year, now.year);
      expect(endAt.month, now.month);
      expect(endAt.day, now.day);
    });
  });
}
