import 'package:equatable/equatable.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/ingredient_category.dart';

enum IngredientType {
  carbohydrate("밥 빵 면"),
  vegetable("채소 및 과일"),
  meatsAndEggs("육류 및 계란"),
  fishAndShrimp("생선류"),
  processedFood("가공식품"),
  milkAndNuts("유제품 및 견과류"),
  drink("주류");

  final String label;
  const IngredientType(this.label);
}

class BasicIngredient extends Equatable {
  final String name;

  final IngredientCategory category;

  final IngredientType type;

  const BasicIngredient(
      {required this.name, required this.category, required this.type});

  @override
  List<Object?> get props => [name, category, type];
}
