import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteDatasource {
  final http.Client apiClient;
  final String baseUrl;

  RemoteDatasource({required this.apiClient, required this.baseUrl});

  /// 나의 냉장고 재료 조회 Api
  Future<List<Map<String, dynamic>>> getMyIngredient() async {
    return apiClient.get(Uri.parse(baseUrl)).then((response) =>
        List<Map<String, dynamic>>.from(jsonDecode(response.body)));
  }
}
