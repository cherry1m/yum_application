import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_state.dart';
import 'package:yum_application/src/features/ingredients/ui/views/error_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/loading_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/my_refreginator_fab_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/my_refreginator_freezer_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/my_refreginator_fridge_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/my_refreginator_title_view.dart';
import 'package:yum_application/src/features/ingredients/ui/views/my_refreginator_toggle_is_warning_view.dart';
import 'package:yum_application/src/features/ingredients/ui/viewModels/refreginator_ingredient_list_view_model.dart';

class MyRefreginatorUI extends ConsumerWidget {
  const MyRefreginatorUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(refreginatorIngredientListViewModelProvider);
    return Scaffold(
      body: switch (state.status) {
        RefreginatorIngredientListStatus.loading => const LoadingView(),
        RefreginatorIngredientListStatus.failure => const ErrorView(),
        _ => const Scaffold(
            floatingActionButton: MyRefreginatorFabView(),
            body: SafeArea(
              top: true,
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // 헤더 영역
                    MyRefreginatorTitleView(),
                    // 기간임박 필터 토글 버튼
                    MyRefreginatorToggleIsWarningView(),
                    // 냉동칸
                    MyRefreginatorFreezerView(),
                    // 냉장칸
                    MyRefreginatorFridgeView(),
                  ],
                ),
              ),
            ),
          ),
      },
    );
  }
}
