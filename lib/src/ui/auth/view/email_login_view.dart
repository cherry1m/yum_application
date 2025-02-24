import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/auth/view/next_button_view.dart';

class EmailLoginView extends StatelessWidget {
  const EmailLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _button() => const NextButtonView();
}
