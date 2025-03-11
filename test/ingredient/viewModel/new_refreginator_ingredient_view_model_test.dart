import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_state.dart';
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
      expect(viewModel.selectedIngredient, null);
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

    test("재료 선택 후 UpdateSelectedIngredientName Event를 통해서 새로운 이름을 지정할 수 있다.",
        () {
      final selectIngredient =
          BasicIngredient(name: "egg", category: IngredientCategory.egg);
      final event =
          SelectNewIngredientEvent(selectIngredient: selectIngredient);
      viewModel.onEvent(event);

      final updateNameEvent = UpdateSelectedIngredientName(newName: "달걀");

      viewModel.onEvent(updateNameEvent);

      expect(viewModel.state.name, "달걀");
    });

    test("재료 선택 후 UpdateSelectedIngredientStartAt Event를 통해서 구매일을 지정할 수 있다.",
        () {
      final selectIngredient =
          BasicIngredient(name: "egg", category: IngredientCategory.egg);
      final event =
          SelectNewIngredientEvent(selectIngredient: selectIngredient);
      viewModel.onEvent(event);
      final newStartAt = DateTime(2024, 11, 19);
      final updateSelectedIngredientStartAt =
          UpdateSelectedIngredientStartAt(newStartAt: newStartAt);
      viewModel.onEvent(updateSelectedIngredientStartAt);

      expect(viewModel.state.startAt, newStartAt);
    });

    test("재료 선택 후 UpdateSelectedIngredientEndAt Event를 통해서 유통기한 종료일을 지정할 수 있다.",
        () {
      final selectIngredient =
          BasicIngredient(name: "egg", category: IngredientCategory.egg);
      final event =
          SelectNewIngredientEvent(selectIngredient: selectIngredient);
      viewModel.onEvent(event);

      final newEndAt = DateTime(2024, 11, 19);
      final updateSelectedIngredientEndAt =
          UpdateSelectedIngredientEndAt(newEndAt: newEndAt);
      viewModel.onEvent(updateSelectedIngredientEndAt);

      expect(viewModel.state.endAt, newEndAt);
    });

    test("ToggleSelectedIngredientIsFreezed Event를 통해서 냉동 냉장 여부를 선택할 수 있다.",
        () {
      // 초기는 냉장 상태
      expect(viewModel.state.isFreezed, false);
      final toggleEvent = ToggleSelectedIngredientIsFreezed();
      viewModel.onEvent(toggleEvent);
      expect(viewModel.state.isFreezed, true);

      viewModel.onEvent(toggleEvent);
      expect(viewModel.state.isFreezed, false);
    });

    test("ToggleSelectedIngredientIsINF를 통해서 선택한 재료의 유통기한 지정 여부를 결정할 수 있다.",
        () {
      final selectIngredient =
          BasicIngredient(name: "egg", category: IngredientCategory.egg);
      final event =
          SelectNewIngredientEvent(selectIngredient: selectIngredient);
      viewModel.onEvent(event);

      final isINFEvent = ToggleSelectedIngredientIsINF(isINF: true);

      viewModel.onEvent(isINFEvent);

      expect(viewModel.state.isINF, true);

      final isNotINFEvent = ToggleSelectedIngredientIsINF(isINF: false);

      viewModel.onEvent(isNotINFEvent);

      expect(viewModel.state.isINF, false);
    });

    test("MoveToUpdatePrevIngredient Event를 통해서 기존 식재료를 통해서 햔제 상태로 갱신할 수 있다.",
        () {
      final prevIngredient = RefreginatorIngredient(
        id: 1,
        name: "달걀",
        category: IngredientCategory.egg,
        isFreezed: false,
        startAt: DateTime(2024, 11, 19),
        endAt: DateTime(2024, 11, 24),
      );

      final event = MoveToUpdatePrevIngredient(prevIngredient: prevIngredient);
      viewModel.onEvent(event);

      expect(viewModel.state.id!, 1);
      expect(viewModel.state.name, "달걀");

      expect(
          viewModel.state.selectedIngredient!.category, IngredientCategory.egg);

      expect(viewModel.state.isFreezed, false);
      expect(viewModel.state.startAt, DateTime(2024, 11, 19));
      expect(viewModel.state.endAt, DateTime(2024, 11, 24));
      expect(viewModel.state.type, SelectType.update);
    });
  });
}
