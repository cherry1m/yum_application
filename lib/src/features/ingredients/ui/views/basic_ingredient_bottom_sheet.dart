import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/basic_ingredient_list_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/views/ingredient_grid_view.dart';
import 'package:yum_application/src/ui/common/widgets/basic_bottom_sheet.dart';
import 'package:yum_application/src/features/ingredients/ui/views/favorite_basic_ingredient_view.dart';

class BasicIngredientBottomSheet extends ConsumerWidget {
  final ValueSetter<BasicIngredient>? onItemTap;
  const BasicIngredientBottomSheet({super.key, this.onItemTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basicIngredientListState =
        ref.watch(basicIngredientListViewModelProvider);
    return BasicBottomSheet(
      height: 634,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32.0)),
        child: SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 70, bottom: 138, right: 22, left: 22),
          child: Column(
            children: [
              // basicIngredientListState.favorites
              FavoriteBasicIngredientView(
                onItemTap: onItemTap,
              ),
              ...IngredientType.values.map((type) {
                final ingredients =
                    basicIngredientListState.getBasicIngredientBy(type);
                return BasicIngredientGridView(
                  ingredients: ingredients,
                  label: type.label,
                  onItemTap: onItemTap,
                );
              })
            ],
          ),
        )),
      ),
    );
  }
}
