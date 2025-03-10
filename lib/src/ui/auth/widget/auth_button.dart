import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const AuthButton({super.key, this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 68,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(label, style: theme.textTheme.bodySmall),
    );
  }
}
