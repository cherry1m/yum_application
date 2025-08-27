import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/create_refreginator_ingredient_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/views/ingredient_add_button_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/select_ingredient_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/ingredient_add_expiration_date_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/ingredient_name_text_field_view.dart';
import 'package:yum_application/src/features/ingredients/ui/widgets/ingredient_freezed_toggle_widget.dart';

class CreateIngredientUI extends ConsumerWidget {
  const CreateIngredientUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final createIngredientVM =
        ref.read(createRefreginatorIngredientViewModelProvider.notifier);
    final createIngredientState =
        ref.watch(createRefreginatorIngredientViewModelProvider);
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
              child: Center(child: SelectIngredientView()),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: IngredientFreezedToggleWidget(
                  isFreezed: createIngredientState.isFreezed,
                  onChanged: (value) {
                    createIngredientVM
                        .onEvent(ToggleSelectedIngredientIsFreezed());
                  },
                )),
            const IngredientNameTextFieldView(),
            const IngredientAddExpirationDateView(),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(top: 24.0, bottom: 40.0),
          child: IngredientAddButtonView()),
    );
  }
}
