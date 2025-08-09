import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';
import 'package:yum_application/src/ui/common/widgets/yum_fab_widget.dart';
import 'package:yum_application/src/features/ingredients/ui/page/ingredient_create_update_page.dart';

class MyRefreginatorFabView extends StatelessWidget {
  const MyRefreginatorFabView({super.key});

  @override
  Widget build(BuildContext context) {
    return YumFabWidget(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const IngredientCreateUpdatePage()));
        },
        path: ImagePath.fabAdd);
  }
}
