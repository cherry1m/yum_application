import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yum_application/src/features/app/presentation/viewModels/bottom_nav_view_model.dart';

part 'app_di.g.dart';

@riverpod
BottomNavViewModel bottomNavViewModel(Ref ref) {
  return BottomNavViewModel();
}
