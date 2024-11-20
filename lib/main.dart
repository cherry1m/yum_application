import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ingredient/view/home_view.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:yum_application/src/util/app_theme.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => IngredientViewModel(
            ingredientRepository: IngredientRepository(
                remoteDatasource: RemoteDatasource(apiClient: http.Client()))),
        builder: (context, child) => MaterialApp(
              theme: light,
              darkTheme: dark,
              home: const HomeView(),
            ));
  }
}
