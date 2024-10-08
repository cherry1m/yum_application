import 'package:flutter/material.dart';
import 'package:yum_application/src/ingredient/model/ingredient.dart';

import 'package:yum_application/src/ingredient/widget/refreginator_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _header(),
            _freezer(),
            _fridge(),
          ],
        ),
      ),
    );
  }

  Widget _header() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Row(
          children: [
            Text(
              "나의 냉장고",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      );

  Widget _freezer() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreginatorContainer(
          label: "냉동 보관",
          children: List.generate(
            22,
            (index) => Ingredient(
                name: "name $index",
                image: Container(),
                category: IngredientCategory.drink),
          ),
        ),
      );

  Widget _fridge() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreginatorContainer(
            label: "냉장 보관",
            rowCount: 3,
            children: List.generate(
              40,
              (index) => Ingredient(
                  name: "name $index",
                  image: Container(),
                  category: IngredientCategory.drink),
            )),
      );
}
