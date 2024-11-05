import 'package:flutter/material.dart';
import 'package:yum_application/src/ingredient/model/ingredient.dart';

class IngredientTile extends StatefulWidget {
  final Ingredient ingredient;

  const IngredientTile({
    super.key,
    required this.ingredient,
  });

  @override
  State<IngredientTile> createState() => _IngredientTileState();
}

class _IngredientTileState extends State<IngredientTile> {
  void _toggle() {
    setState(() {
      widget.ingredient.updateIsFavorite();
    });
  }

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
            children: [widget.ingredient.image, Text(widget.ingredient.name)],
          ),
          Positioned(
            top: 2.0,
            right: 2.0,
            child: GestureDetector(
                onTap: _toggle,
                child: (widget.ingredient.isFavorite)
                    ? const Icon(
                        Icons.favorite,
                        color: Color(0xffF5713E),
                      )
                    : Icon(
                        Icons.favorite_outline,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      )),
          )
        ],
      ),
    );
  }
}
