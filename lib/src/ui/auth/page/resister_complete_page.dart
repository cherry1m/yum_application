import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/ui/auth/model/sign_up.dart';
import 'package:yum_application/src/ui/auth/view/resister_complete_view.dart';
import 'package:yum_application/src/ui/auth/viewModel/resister_complete_view_model.dart';

class ResisterCompletePage extends StatelessWidget {
  final SignUp signUp;
  const ResisterCompletePage({super.key, required this.signUp});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResisterCompleteViewModel(signUp: signUp),
      child: const ResisterCompleteView(),
    );
  }
}
