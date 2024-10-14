import 'package:flutter/material.dart';

import 'package:yum_application/src/ingredient/view/ingredient_add_view.dart';
import 'package:yum_application/src/util/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light,
      darkTheme: dark,
      home: const Scaffold(
          body: Center(
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: IngredientAddView(),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: IngredientAddView(
                  reverse: false,
                ),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: IngredientAddView(),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: IngredientAddView(
                  reverse: false,
                ),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: IngredientAddView(),
              )),
            ],
          ),
        ),
      )),
    );
  }
}
