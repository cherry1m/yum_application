import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const NextButton({super.key, this.onTap, this.label = "다음"});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 350,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: theme.colorScheme.primary),
        child: Text(label, style: theme.textTheme.bodyLarge),
      ),
    );
  }
}
