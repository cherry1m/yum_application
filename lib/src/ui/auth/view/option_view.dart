import 'package:flutter/material.dart';

class OptionView extends StatelessWidget {
  const OptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              "아이디 찾기",
              style: theme.textTheme.labelMedium,
            ),
          ),
          const SizedBox(
            width: 40,
            child: VerticalDivider(
              width: 16,
              thickness: 1,
              color: Color(0xffa2a2a2),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "비밀번호 찾기",
              style: theme.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
