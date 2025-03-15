import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/core/providers/ingredient/basic_ingredient_view_model_provider.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/basic_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';
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
        builder: (newContext) {
          return MultiProvider(
              providers: [
                baiscIngredientViewModelProvider,
                ListenableProvider(
                  create: (newContext) =>
                      context.read<NewRefreginatorIngredientViewModel>(),
                )
              ],
              builder: (newContext, child) =>
                  const BasicIngredientBottomSheet());
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: showIngredientAddBottomSheet,
        child: Text("+ 아이콘", style: Theme.of(context).textTheme.titleLarge));
  }
}

class BasicIngredientView {}
