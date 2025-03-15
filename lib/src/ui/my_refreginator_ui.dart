import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_list_model.dart';
import 'package:yum_application/src/ui/ingredient/view/error_view.dart';
import 'package:yum_application/src/ui/ingredient/view/loading_view.dart';
import 'package:yum_application/src/ui/ingredient/view/my_refreginator_freezer_view.dart';
import 'package:yum_application/src/ui/ingredient/view/my_refreginator_fridge_view.dart';
import 'package:yum_application/src/ui/ingredient/view/my_refreginator_title_view.dart';
import 'package:yum_application/src/ui/ingredient/view/my_refreginator_toggle_is_warning_view.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/refreginator_ingredient_view_model.dart';

class MyRefreginatorUI extends StatelessWidget {
  const MyRefreginatorUI({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RefreginatorIngredientViewModel>();
    final state = viewModel.state;
    return switch (state) {
      ErrorState() => _error(),
      LoadingState() => _loading(),
      _ => SafeArea(
          top: true,
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 헤더 영역
                _header(),
                // 기간임박 필터 토글 버튼
                _toggleWarning(),
                // 냉동칸
                _freezer(),
                // 냉장칸
                _fridge(),
              ],
            ),
          ),
        ),
    };
  }

  /// 헤더 영역입니다.
  ///
  /// 나의 냉장고 UI 상단에 보여지는 위젯입니다.
  Widget _header() => const MyRefreginatorTitleView(
        key: Key("my-refreginator-title-view"),
      );

  /// 기간임박 필터 토글 영역
  ///
  Widget _toggleWarning() => const MyRefreginatorToggleIsWarningView(
        key: Key("my-refreginator-toggle-is-warning-view"),
      );

  /// 냉동칸 영역입니다.
  ///
  /// 사용자의 냉동칸에 해당하는 [RefreginatorIngredient]를 보여줍니다.
  Widget _freezer() {
    return const MyRefreginatorFreezerView(
      key: Key("my-refreginator-freezer-view"),
    );
  }

  /// 냉장칸 영역입니다.
  ///
  /// 사용자의 냉장칸에 해당하는 [RefreginatorIngredient]를 보여줍니다.
  Widget _fridge() {
    return const MyRefreginatorFridgeView(
      key: Key("my-refreginator-fridge-view"),
    );
  }

  /// 로딩 위젯
  ///
  /// 데이터 통신간 로딩 중 렌더링 되는 위젯
  Widget _loading() => const LoadingView();

  /// 에러 위젯
  ///
  /// 데이터 통신 간 에러가 발생하면
  /// 해당 위젯이 렌더링 됩니다.
  Widget _error() => const ErrorView(
        key: Key("my-refreginator-error-view"),
      );
}
