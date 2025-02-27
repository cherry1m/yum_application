import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteDatasourceImpl implements RemoteDatasource {
  final client = http.Client();
  final String baseUrl;

  RemoteDatasourceImpl({required this.baseUrl});

  @override
  Future<List<Map<String, dynamic>>> getAllRecipes() {
    return client.get(Uri.parse("$baseUrl/api/recipes")).then((response) {
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }
}

abstract class RemoteDatasource {
  Future<List<Map<String, dynamic>>> getAllRecipes();
}
