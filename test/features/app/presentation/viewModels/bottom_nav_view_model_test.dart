import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:yum_application/src/features/app/presentation/viewModels/bottom_nav_view_model.dart';

void main() {
  group(BottomNavViewModel, () {
    late ProviderContainer container;

    void onChange(int value) {
      container.read(bottomNavViewModelProvider.notifier).onChanged(value);
    }

    setUp(() {
      container = ProviderContainer();
    });

    test('should return initial value home', () {
      expect(container.read(bottomNavViewModelProvider),
          equals(BottomNavStatus.home));
    });

    test('should return home when onChange call with 0', () {
      onChange(0);

      expect(container.read(bottomNavViewModelProvider),
          equals(BottomNavStatus.home));
    });

    test('should return recipe when onChange call with 1', () {
      onChange(1);

      expect(container.read(bottomNavViewModelProvider),
          equals(BottomNavStatus.recipe));
    });

    test('should return alert when onChange call with 2', () {
      onChange(2);

      expect(container.read(bottomNavViewModelProvider),
          equals(BottomNavStatus.alert));
    });

    test('should return mypage when onChange call with 3', () {
      onChange(3);

      expect(container.read(bottomNavViewModelProvider),
          equals(BottomNavStatus.mypage));
    });
  });
}
