import 'package:flutter/material.dart';

/// 로그인 UI에서 사용자가 아이디 찾기 혹은 비밀번호 찾기 UI로 이동할 수 있는
/// 옵션 영역을 담당합니다.
class OptionView extends StatelessWidget {
  const OptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 비밀번호 찾기
          GestureDetector(
            // 비밀번호 찾기 UI로 이동
            onTap: () {},
            child: Text(
              "비밀번호 재설정",
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
