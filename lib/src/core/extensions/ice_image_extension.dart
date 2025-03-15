import 'package:yum_application/src/ui/common/widgets/image_widget.dart';

/// [IceImage]는 [SelectIngredientImage]에서 사용되는
/// 얼음 백그라운드와 포어그라운드 이미지 path의 String getter 확장입니다.
extension IceImage on ImagePath {
  static String get background => "assets/images/ice_background.png";
  static String get foreground => "assets/images/ice_foreground.png";
}
