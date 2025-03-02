import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/view/resister_view.dart';
import 'package:yum_application/src/ui/auth/viewModel/resister_view_model.dart';

class ResisterPage extends StatelessWidget {
  const ResisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResisterViewModel(),
      child: const ResisterView(),
    );
  }
}
