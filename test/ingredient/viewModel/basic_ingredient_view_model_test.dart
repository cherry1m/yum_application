import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/basic_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/basic_ingredient_view_model.dart';

import 'basic_ingredient_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepository>()])
void main() {
  late IngredientRepository ingredientRepository;
  late BasicIngredientViewModel viewModel;

  setUp(() {
    ingredientRepository = MockIngredientRepository();
    viewModel =
        BasicIngredientViewModel(ingredientRepository: ingredientRepository);
  });

  group("BasicIngredientViewModel Unit Test", () {
    test("ViewModel은 초기에 LoadingState이다.", () async {
      expect(viewModel.state is LoadingState, true);
    });
  });
}
