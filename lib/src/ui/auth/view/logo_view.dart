import 'package:flutter/material.dart';

/// 로그인 UI에서 상단에 렌더링되는 로고입니다.
///
/// 현재는 "로그인"이라는 텍스트로 구성되어있습니다.
class LogoView extends StatelessWidget {
  final String label;
  const LogoView({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: theme.textTheme.headlineLarge,
    );
  }
}
