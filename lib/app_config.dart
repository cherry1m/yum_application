import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:http/http.dart' as http;

List<ChangeNotifierProvider> getInitProvider() {
  final String? baseUrl = dotenv.env["BASE_URL"];
  return [
    ChangeNotifierProvider(
        create: (context) => IngredientViewModel(
            ingredientRepository: IngredientRepository(
                remoteDatasource: RemoteDatasource(
                    apiClient: http.Client(),
                    baseUrl: "${baseUrl!}/api/ingredients"))))
  ];
}
