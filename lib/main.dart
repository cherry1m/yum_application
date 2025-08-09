import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yum_application/firebase_options.dart';
import 'package:yum_application/src/ui/auth/page/login_page.dart';
import 'package:yum_application/src/core/theme/app_theme.dart';
import 'package:yum_application/src/core/utils/global_variable.dart';
import 'package:yum_application/src/ui/my_refreginator_ui.dart';

import 'src/core/providers/app_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  // final providers = getInitProvider();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
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
        home: const MyRefreginatorUI());
  }
}
