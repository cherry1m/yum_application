import 'package:flutter/material.dart';
import 'package:yum_application/src/common/basic_bottom_sheet.dart';
import 'package:yum_application/src/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_image.dart';

class IngredientEditBottomSheet extends StatefulWidget {
  final Ingredient ingredient;
  const IngredientEditBottomSheet({super.key, required this.ingredient});

  @override
  State<IngredientEditBottomSheet> createState() =>
      _IngredientEditBottomSheetState();
}

class _IngredientEditBottomSheetState extends State<IngredientEditBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
        height: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _top(),
            _middle(),
            _bottom(),
          ],
        ));
  }

  Widget _top() => Padding(
        padding: const EdgeInsets.only(top: 68),
        child: Column(children: [
          Text(
            "소비기한이 46 일 남았어요!",
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Text(
            "2024 년 10 월 12 일 ~ 2024 년 12 월 25 일",
            style: TextStyle(
                fontSize: 16,
                // color: Color(0xfd1c6bb),
                color: Colors.black,
                fontWeight: FontWeight.w400),
          )
        ]),
      );

  Widget _middle() => Column(children: [
        IngredientImage(
            isFreezed: widget.ingredient.isFreezed,
            path: widget.ingredient.category.imagePath),
        Text(
          widget.ingredient.name,
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.w500),
        )
      ]);

  Widget _bottom() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              backgroundColor: Theme.of(context).colorScheme.primary,
              fixedSize: const Size(173, 48),
            ),
            onPressed: () {},
            child: Text(
              "수정하기",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                backgroundColor: Theme.of(context).colorScheme.primary,
                fixedSize: const Size(173, 48),
              ),
              onPressed: () {},
              child: Text(
                "삭제하기",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
