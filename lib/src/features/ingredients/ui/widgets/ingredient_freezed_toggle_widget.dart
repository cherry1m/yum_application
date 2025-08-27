import 'package:flutter/material.dart';

class IngredientFreezedToggleWidget extends StatelessWidget {
  final bool isFreezed;
  final Function(bool value)? onChanged;
  const IngredientFreezedToggleWidget(
      {super.key, required this.isFreezed, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "냉동",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Switch.adaptive(
          value: isFreezed,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.secondary,
          inactiveThumbColor: Colors.grey,
        )
      ],
    );
  }
}
