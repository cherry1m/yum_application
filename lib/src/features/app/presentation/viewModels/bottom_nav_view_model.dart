import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_view_model.g.dart';

enum BottomNavStatus { home, recipe, alert, mypage }

@riverpod
class BottomNavViewModel extends _$BottomNavViewModel {
  @override
  BottomNavStatus build() {
    return BottomNavStatus.home;
  }

  onChanged(int value) {
    state = BottomNavStatus.values[value];
  }
}
