import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/ui/ingredient/model/model.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  late final MockClient apiClient;
  const baseUrl = String.fromEnvironment("BASE_URL");
  late final RemoteDatasource remoteDatasource;

  group("Ingredient Remote Datasource Unit Test", () {
    setUpAll(() {
      apiClient = MockClient();
      remoteDatasource =
          RemoteDatasourceImpl(apiClient: apiClient, baseUrl: baseUrl);
    });
    test("'/api/ingredients' GET요청이 성공하면 사용자의 재료 데이터를 반환한다", () async {
      when(apiClient.get(Uri.parse("$baseUrl/api/ingredients")))
          .thenAnswer((_) async => http.Response('''
          [
            {
              "id" : 1, 
              "name" : "egg", 
              "isFreezed" : false, 
              "isFavorite": false, 
              "category": "egg",
              "startAt" : "2024-11-12", 
              "endAt": "2024-11-17"
            }
          ]
          ''', 200));

      final result = await remoteDatasource.getMyIngredient();
      verify(apiClient.get(Uri.parse("$baseUrl/api/ingredients"))).called(1);
      expect(result.length, 1);
    });

    test("'/api/ingredients' GET요청이 실패하면 에러를 반환한다", () async {
      when(apiClient.get(Uri.parse("$baseUrl/api/ingredients"))).thenAnswer(
          (_) async => http.Response('{"error": "Something went wrong"}', 400));

      expect(() => remoteDatasource.getMyIngredient(),
          throwsA(isA<Map<String, dynamic>>()));
    });

    test("'/api/ingredients' POST요청이 성공하면 사용자의 생성한 재료 데이터를 반환한다", () async {
      final testBody = {
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };
      when(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response('''
            {
              "name" : "egg", 
              "isFreezed" : false, 
              "category": "egg",
              "startAt" : "2024-11-12", 
              "endAt": "2024-11-17"
            }
''', 201));

      final result = await remoteDatasource.createNewIngredient(testBody);
      verify(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
      expect(result["name"], "egg");
    });

    test("'/api/ingredients' POST요청이 실패하면 에러를 반환한다", () async {
      final testBody = {
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };
      when(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer(
          (_) async => http.Response('{"error": "Something went wrong"}', 400));

      expect(() => remoteDatasource.createNewIngredient(testBody),
          throwsA(isA<Map<String, dynamic>>()));
    });

    test("'/api/ingredients PUT 요청이 성공하면 갱신된 재료 데이터를 반환한다.'", () async {
      final testBody = {
        "id": 1,
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };

      when(apiClient.put(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response('''
            {
              "name" : "egg", 
              "isFreezed" : false, 
              "category": "egg",
              "startAt" : "2024-11-12", 
              "endAt": "2024-11-17"
            }
''', 200));

      final result = await remoteDatasource.updateIngredient(testBody);
      verify(apiClient.put(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
      expect(result["name"], "egg");
    });

    test("'/api/ingredients' PUT요청이 실패하면 에러를 반환한다", () async {
      final testBody = {
        "id": 1,
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };
      when(apiClient.put(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer(
          (_) async => http.Response('{"error": "Something went wrong"}', 400));

      expect(() => remoteDatasource.updateIngredient(testBody),
          throwsA(isA<Map<String, dynamic>>()));
    });

    test("'/api/ingredients' DELETE요청이 성공하면 204의 응답코드를 반환한다", () {
      const id = 1;
      when(apiClient.delete(Uri.parse("$baseUrl/api/ingredients/$id")))
          .thenAnswer((_) async => http.Response("", 204));
      remoteDatasource.deleteIngredient(id);
      expect(apiClient.delete(Uri.parse("$baseUrl/api/ingredients/$id")),
          completes);
    });

    test("'/api/ingredients/favorites' GET 요청이 성공하면 200의 응답코드와 즐겨찾기 재료를 반환한다.",
        () async {
      when(apiClient.get(Uri.parse("$baseUrl/api/ingredients/favorites")))
          .thenAnswer((_) async => http.Response("""
      [
        {
          "category": "egg"
        }
      ]
""", 200));

      expect(remoteDatasource.getMyFavoriteIngredient(), completes);
      verify(apiClient.get(Uri.parse("$baseUrl/api/ingredients/favorites")))
          .called(1);
    });

    test("'/api/ingredients/favorites' GET 요청이 실패하면 에러를 반환한다", () {
      when(apiClient.get(Uri.parse("$baseUrl/api/ingredients/favorites")))
          .thenAnswer((_) async => http.Response("""
  {"error": "Something went wrong"}
""", 400));
      expect(() => remoteDatasource.getMyFavoriteIngredient(),
          throwsA(isA<Map<String, dynamic>>()));
    });

    test("'/api/ingredients/favorites' POST 요청이 성공하면 201의 응답코드와 생성된 카테고리를 반환한다",
        () async {
      const testBody = {"category": "egg"};
      when(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response("{'category': 'egg'}", 201));

      expect(remoteDatasource.createNewFavoriteIngredient(testBody), completes);
      verify(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
    });

    test("'/api/ingredients/favorites' POST 요청이 실패하면 에러를 반환한다", () async {
      const testBody = {"category": "egg"};
      when(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response("""
{"error":"something is wrong"}
""", 400));

      expect(() => remoteDatasource.createNewFavoriteIngredient(testBody),
          throwsA(isA<Map<String, dynamic>>()));
      verify(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
    });

    test(
        "'/api/ingredients/favorites' DELETE 요청이 성공하면 201의 응답코드와 생성된 카테고리를 반환한다",
        () async {
      const testBody = {"category": "egg"};
      when(apiClient.delete(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response("", 200));

      expect(remoteDatasource.deleteFavoriteIngredient(testBody), completes);
      verify(apiClient.delete(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
    });

    test("'/api/ingredients/favorites' DELETE 요청이 실패하면 애러를 반환한다", () async {
      const testBody = {"category": "egg"};
      when(apiClient.delete(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response("""
{"error":"something is wrong"}
""", 400));

      expect(() => remoteDatasource.deleteFavoriteIngredient(testBody),
          throwsA(isA<Map<String, dynamic>>()));
      verify(apiClient.delete(
        Uri.parse("$baseUrl/api/ingredients/favorites"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
    });
  });
}
