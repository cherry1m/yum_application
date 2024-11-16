import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yum_application/src/ingredient/model/ingredient.dart';

class IngredientRepository {
  final String baseUrl =
      "http://ec2-43-203-35-91.ap-northeast-2.compute.amazonaws.com:8080/api/ingredients";

  /**
   * 나의 냉장고 재료 조회 Api
   */
  Future<List<Ingredient>> getMyIngredient() async {
    return http.get(Uri.parse(baseUrl)).then((response) =>
        List<Map<String, dynamic>>.from((jsonDecode(response.body)))
            .map((data) => Ingredient.fromJson(data))
            .toList());
  }
}
