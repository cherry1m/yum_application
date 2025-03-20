import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("에러가 발생했습니다!"),
            )
          ],
        ),
      ),
    );
  }
}
