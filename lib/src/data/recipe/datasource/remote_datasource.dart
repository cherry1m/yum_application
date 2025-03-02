import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteDatasourceImpl implements RemoteDatasource {
  final http.Client apiClient;
  final String baseUrl;

  RemoteDatasourceImpl({
    required this.apiClient,
    required this.baseUrl,
  });

  @override
  Future<List<Map<String, dynamic>>> getAllRecipes() {
    return apiClient
        .get(Uri.parse("$baseUrl/api/recipes?page=0&size=10"))
        .then((response) {
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(
            jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }
}

abstract class RemoteDatasource {
  Future<List<Map<String, dynamic>>> getAllRecipes();
}
