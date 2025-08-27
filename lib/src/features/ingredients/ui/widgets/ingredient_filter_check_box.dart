import 'package:flutter/material.dart';

class IngredientFilterCheckBox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueSetter<bool> onChanged;

  const IngredientFilterCheckBox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _basicBox(context),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _basicBox(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: GestureDetector(
          key: const Key("ingredient-filter-check-box-toggle-tap"),
          onTap: () {
            onChanged(!value);
          },
          child: SizedBox(
            width: 20,
            height: 20,
            child: value ? _checkedBox(context) : _unCheckedBox(context),
          ),
        ),
      );

  Widget _checkedBox(BuildContext context) => Container(
        key: const Key("ingredient-filter-on-check-box"),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: const Icon(
          Icons.check,
          size: 12,
          color: Colors.white,
        ),
      );

  Widget _unCheckedBox(BuildContext context) => Container(
        key: const Key("ingredient-filter-off-check-box"),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(width: 1, color: const Color(0xffa2a2a2)),
        ),
      );
}
