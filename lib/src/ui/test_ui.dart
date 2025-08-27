import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/widget/ingredient_list_tile.dart';

class TestUi extends StatelessWidget {
  const TestUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IngredientListTile(
          name: "양파",
          count: 2,
          date: '2025-09-30',
          isExpiring: true,
          onEdit: () {},
          onDelete: () {},
        ),
      ),
    );
  }
}
