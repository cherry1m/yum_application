import 'package:flutter/material.dart';
import 'package:yum_application/src/features/ingredients/ui/views/create_ingredient_ui.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';
import 'package:yum_application/src/ui/common/widgets/yum_fab_widget.dart';

class MyRefreginatorFabView extends StatelessWidget {
  const MyRefreginatorFabView({super.key});

  @override
  Widget build(BuildContext context) {
    return YumFabWidget(
        onPressed: () {
          /// 식재료 생성 UI로 이동
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateIngredientUI()));
        },
        path: ImagePath.fabAdd);
  }
}
