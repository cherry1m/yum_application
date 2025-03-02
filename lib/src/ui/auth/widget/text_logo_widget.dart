import 'package:flutter/material.dart';

class TextLogoWidget extends StatelessWidget {
  final String label;
  const TextLogoWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      label,
      style: theme.textTheme.headlineLarge,
    );
  }
}
