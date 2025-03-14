import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/main_ui.dart';
import 'package:yum_application/src/ui/main_ui_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainUIViewModel>(
      create: (context) => MainUIViewModel(),
      child: const MainUI(),
    );
  }
}
