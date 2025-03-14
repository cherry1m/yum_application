import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/ingredient/widget/basic_ingredient_bottom_sheet.dart';

class UnSelectIngredientImage extends StatefulWidget {
  const UnSelectIngredientImage({super.key});

  @override
  State<UnSelectIngredientImage> createState() =>
      _UnSelectIngredientImageState();
}

class _UnSelectIngredientImageState extends State<UnSelectIngredientImage> {
  /// 사용자 기본 재료 선택 바텀 시트 함수
  void showIngredientAddBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.red,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.0))),
        context: context,
        builder: (context) => const BasicIngredientBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: showIngredientAddBottomSheet,
        child: Text("+ 아이콘", style: Theme.of(context).textTheme.titleLarge));
  }
}
