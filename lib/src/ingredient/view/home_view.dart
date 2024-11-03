import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yum_application/src/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/view/ingredient_add_view.dart';

import 'package:yum_application/src/ingredient/widget/refreginator_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fab(context),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _header(context),
            _freezer(context),
            _fridge(context),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
      child: Row(
        children: [
          Text(
            "나의 냉장고",
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _freezer(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: RefreginatorContainer(
        labelStyle: textTheme.titleSmall,
        itemStyle: textTheme.displayMedium,
        label: "냉동 보관",
        children: List.generate(
          22,
          (index) => Ingredient(
              isFreezed: true,
              name: "재료",
              category: IngredientCategory
                  .values[Random().nextInt(IngredientCategory.values.length)]),
        ),
      ),
    );
  }

  Widget _fridge(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: RefreginatorContainer(
          labelStyle: textTheme.titleSmall,
          itemStyle: textTheme.displayMedium,
          label: "냉장 보관",
          rowCount: 3,
          children: List.generate(
            40,
            (index) => Ingredient(
                isFreezed: false,
                name: "재료",
                category: IngredientCategory.values[
                    Random().nextInt(IngredientCategory.values.length)]),
          )),
    );
  }

  Widget _fab(BuildContext context) => FloatingActionButton(
        foregroundColor: const Color(0xffffffff),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const IngredientAddView()));
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      );
}
