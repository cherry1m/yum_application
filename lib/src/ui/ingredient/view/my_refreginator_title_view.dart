import 'package:flutter/material.dart';

class MyRefreginatorTitleView extends StatelessWidget {
  const MyRefreginatorTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "마이 냉장고",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ));
  }
}
