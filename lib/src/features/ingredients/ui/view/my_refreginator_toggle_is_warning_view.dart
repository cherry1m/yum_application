import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/refreginator_ingredient_list_model.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModel/refreginator_ingredient_list_view_model.dart';
import 'package:yum_application/src/features/ingredients/ui/widget/ingredient_filter_check_box.dart';

/// 사용자의 재료 중 유통기한이 3일 이내로 임박한 [RefreginatorIngredient]를
/// 필터링 합니다.
/// On인 경우 필터링이 켜집니다.
/// Off인 경우 필터링이 해제됩니다.
class MyRefreginatorToggleIsWarningView extends ConsumerWidget {
  const MyRefreginatorToggleIsWarningView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel =
        ref.read(refreginatorIngredientViewModelProvider.notifier);
    final state = ref.watch(refreginatorIngredientViewModelProvider
        .select((it) => (it as LoadedState).isWaringFilterOn));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IngredientFilterCheckBox(
              value: state,
              label: "기간 임박",
              onChanged: (value) =>
                  viewModel.onEvent(ToggleIsWarningFilterEvent()))
        ],
      ),
    );
  }
}
