import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/core/extensions/ice_image_extension.dart';
import 'package:yum_application/src/ui/common/widgets/image_widget.dart';
import 'package:yum_application/src/ui/ingredient/model/refreginator_ingredient_model.dart';
import 'package:yum_application/src/ui/ingredient/model/new_refreginator_ingredient_event.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/new_refreginator_ingredient_view_model.dart';

/// 사용자가 재료 생성과정에서 선택한 재료를 보여주는 뷰
///
/// 선택된 재료의 유무에 따라서 각기 다른 화면을 렌더링함.
/// 또한, 선택된 재료의 냉동 냉장 토글링 애니메이션을 수행함.
class SelectIngredientImage extends StatefulWidget {
  final BasicIngredient ingredient;
  final double width;
  const SelectIngredientImage(
      {super.key, this.width = 110, required this.ingredient});

  @override
  State<SelectIngredientImage> createState() => _SelectIngredientImageState();
}

class _SelectIngredientImageState extends State<SelectIngredientImage>
    with TickerProviderStateMixin {
  late AnimationController _backgroundAnimationController;
  late final AnimationController _foregroundAnimationController;
  late final Animation<double> _backgroundAnimation;
  late final Animation<double> _foregroundAnimation;

  void toggle() {
    /// isFreezed의 옵셔널 체이닝을 통해서 null 방지 -> false 부여
    final isFreezed =
        (context.watch<NewRefreginatorIngredientViewModel>().state).isFreezed;

    if (isFreezed) {
      _backgroundAnimationController.forward().then((_) {
        _foregroundAnimationController.forward();
      });
    } else {
      _foregroundAnimationController.reverse().then((_) {
        _backgroundAnimationController.reverse();
      });
    }
  }

  @override
  void initState() {
    // 얼음 에니메이션 컨트롤러
    _backgroundAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _foregroundAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    // 얼음 애니메이션
    _backgroundAnimation = CurvedAnimation(
        parent: _backgroundAnimationController,
        curve: Curves.easeOutBack,
        reverseCurve: Curves.fastOutSlowIn);
    _foregroundAnimation = CurvedAnimation(
        parent: _foregroundAnimationController, curve: Curves.fastOutSlowIn);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    toggle();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SelectIngredientImage oldWidget) {
    toggle();
    super.didUpdateWidget(widget);
  }

  @override
  void dispose() {
    _foregroundAnimationController.dispose();
    _backgroundAnimationController.dispose();
    super.dispose();
  }

  /// 선택된 재료가 있는 경우 선택 재료를 렌더링
  ///
  /// 냉동 냉장 여부에 따라서 얼음 이미지가 토글링 애니메이션을 수행합니다.
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NewRefreginatorIngredientViewModel>();
    return GestureDetector(
        onTap: () => viewModel.onEvent(UnSelectedNewIngredientEvent()),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ScaleTransition(
              scale: _backgroundAnimation,
              child: ImageWidget(
                path: IceImage.background,
                width: widget.width + 200,
              ),
            ),
            ImageWidget(
              path: widget.ingredient.category.imagePath,
              width: widget.width,
            ),
            FadeTransition(
              opacity: _foregroundAnimation,
              child: Opacity(
                opacity: 0.5,
                child: ImageWidget(
                  path: IceImage.background,
                  width: widget.width + 200,
                ),
              ),
            ),
          ],
        ));
  }
}
