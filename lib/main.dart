import 'package:flutter/material.dart';

import 'package:yum_application/src/common/scroll_date_dialog.dart';
import 'package:yum_application/src/ingredient/view/home_view.dart';
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
        backgroundColor: Colors.black,
        body: Center(child: HomeView()),
      ),
    );
  }
}
