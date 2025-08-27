import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/core/extensions/date_format_extension.dart';

void main() {
  group("DateFormatExtension", () {
    test('toyyyyMMdd returns correct formatted string', () {
      final date = DateTime(2025, 8, 9);
      expect(date.toyyyyMMdd(), '2025-08-09');

      final date2 = DateTime(1999, 1, 1);
      expect(date2.toyyyyMMdd(), '1999-01-01');

      final date3 = DateTime(2020, 12, 31);
      expect(date3.toyyyyMMdd(), '2020-12-31');
    });
  });
}
