import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/view/ingredient_add_button_view.dart';
import 'package:yum_application/src/ui/ingredient/view/ingredient_add_description_view.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/ui/ingredient/view/select_ingredient_image.dart';
import 'package:yum_application/src/ui/ingredient/widget/ingredient_add_view_toggle_widget.dart';

class IngredientAddView extends StatelessWidget {
  const IngredientAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context
            .read<NewRefreginatorIngredientViewModel>()
            .onEvent(UnSelectedNewIngredientEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.onPrimaryContainer,
          foregroundColor: theme.onSecondary,
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
          title: Text(
            "새로운 식재료",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(250),
              child: SizedBox(
                height: 250,
                child: Center(
                  /// 선택한 재료가 있는 경우
                  ///
                  /// 현재 선택된 재료 이미지를 볼 수 있음.
                  child: SelectIngredientImage(
                    ingredient: context
                        .watch<NewRefreginatorIngredientViewModel>()
                        .selectedIngredient,
                    width: 300,
                  ),
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _toggle(),
              _description(),
            ],
          ),
        ),
        bottomNavigationBar: _button(),
      ),
    );
  }

  /// 냉동 또는 냉장 여부를 토글하는 버튼 위젯
  Widget _toggle() => const Align(
      alignment: Alignment.bottomRight, child: IngredientAddViewToggleWidget());

  Widget _description() => const IngredientAddDescriptionView();

  Widget _button() => Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 40.0),
      child: Builder(builder: (context) {
        return const IngredientAddButtonView();
      }));
}
