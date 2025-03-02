import 'package:intl/intl.dart';

/// [DateTime]관련 확장
extension DateFormatExtension on DateTime {
  /// [DateTime]을 "yyyy-MM-dd"형식의 [String]으로 반환합니다.
  String toyyyyMMdd() {
    return DateFormat("yyyy-MM-dd").format(this);
  }
}
