import 'package:flutter/material.dart';
import 'package:yum_application/src/App.dart';
import 'package:yum_application/src/util/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const App(),
    );
  }
}
