import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:yum_application/src/ui/auth/page/login_page.dart';
import 'package:yum_application/src/core/utils/theme/app_theme.dart';
import 'package:yum_application/src/core/utils/variable/global_variable.dart';
import 'package:yum_application/src/ui/auth/view/email_login_view.dart';

import 'src/core/providers/app/app_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  // final providers = getInitProvider();
  runApp(const AppProvider(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalVariable.naviagatorState,
      theme: light,
      home: const EmailLoginView(),
    );
  }
}
