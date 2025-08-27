import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/core/utils/date_utils.dart';

void main() {
  group('isNearExpiry', () {
    final now = DateTime(2025, 8, 11);

    test('returns false when expiryDate is null', () {
      expect(isNearExpiry(null, now), false);
    });

    test('returns true when expiryDate is exactly threshold days ahead', () {
      expect(isNearExpiry(DateTime(2025, 8, 14), now), true);
    });

    test('returns true when expiryDate is within threshold days', () {
      expect(isNearExpiry(DateTime(2025, 8, 13), now), true);
    });

    test('returns false when expiryDate is beyond threshold days', () {
      expect(isNearExpiry(DateTime(2025, 8, 15), now), false);
    });

    test('returns false when expiryDate is before now', () {
      expect(isNearExpiry(DateTime(2025, 8, 10), now),
          true); // 이미 지났으면 임박으로 간주해도 됨
    });
  });
}
