import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:yum_application/src/data/recipe/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/recipe/repository/recipe_respository.dart';

final recipeRepositoryProviders = [
  Provider<RemoteDatasource>(
    create: (context) => RemoteDatasourceImpl(
        apiClient: context.read<http.Client>(),
        baseUrl: dotenv.get("BASE_URL")),
  ),
  Provider<RecipeRepository>(
    create: (context) => RecipeRepositoryImpl(
        remoteDatasource: context.read<RemoteDatasource>()),
  )
];
