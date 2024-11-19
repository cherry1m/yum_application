import 'package:flutter/material.dart';

class SingleButton extends StatelessWidget {
  final String text;
  const SingleButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width - 20, 40),
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      onPressed: () {
        debugPrint("h");
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
