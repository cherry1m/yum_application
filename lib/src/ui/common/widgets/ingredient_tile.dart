import 'package:flutter/material.dart';
import 'package:yum_application/src/features/ingredients/domain/entities/basic_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/widgets/ingredient_image.dart';

class IngredientTile extends StatelessWidget {
  final BasicIngredient ingredient;
  final void Function()? onTap;
  final bool isFavorite;
  const IngredientTile({
    super.key,
    required this.ingredient,
    required this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IngredientImage(
                path: ingredient.category.imagePath,
                isWarning: false,
              ),
              Text(ingredient.name,
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          Positioned(
              top: 2.0,
              right: 2.0,
              child: GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: Theme.of(context).colorScheme.secondary,
                  )))
        ],
      ),
    );
  }
}
