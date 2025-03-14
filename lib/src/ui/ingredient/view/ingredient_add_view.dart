import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/ingredient/view/ingredient_add_button_view.dart';
import 'package:yum_application/src/ui/ingredient/view/ingredient_add_curr_ingredient_view.dart';
import 'package:yum_application/src/ui/ingredient/view/ingredient_add_description_view.dart';
import 'package:yum_application/src/ui/ingredient/view/ingredient_add_name_view.dart';
import 'package:yum_application/src/ui/ingredient/widget/ingredient_add_view_toggle_widget.dart';

class IngredientAddView extends StatelessWidget {
  const IngredientAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onPrimary,
        foregroundColor: Colors.black,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
        title: Text(
          "새로운 식재료",
          style: theme.textTheme.headlineLarge,
        ),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(250),
            child: SizedBox(
              height: 250,
              child: Center(child: IngredientAddCurrIngredientView()),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _toggle(),
            _name(),
            _expiration(),
          ],
        ),
      ),
      bottomNavigationBar: _button(),
    );
  }

  /// 냉동 또는 냉장 여부를 토글하는 버튼 위젯
  Widget _toggle() => const Align(
      alignment: Alignment.bottomRight, child: IngredientAddViewToggleWidget());

  Widget _name() => const IngredientAddNameView();

  Widget _expiration() => const IngredientAddExpirationDateView();

  Widget _button() => Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 40.0),
      child: Builder(builder: (context) {
        return const IngredientAddButtonView();
      }));
}
