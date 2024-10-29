import 'package:flutter/material.dart';

class BasicBottomSheet extends StatelessWidget {
  final Widget child;
  const BasicBottomSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: child,
    );
  }
}
