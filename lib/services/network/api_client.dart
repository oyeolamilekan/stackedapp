import 'dart:convert';
import 'dart:io';

import 'package:stackedapp/config/constants.dart';
import 'package:stackedapp/config/response.dart';
import 'package:stackedapp/services/storage.dart';
import 'package:http/http.dart' as http;

import '../set_up.dart';

class APIClient {
  final storage = locator<Storage>();

  Future<http.Response> get(
    String url, {
    bool auth = false,
    baseUrl = BASE_URL,
  }) async {
    String? value = storage.getString("token");

    Map<String, String> headers = {...HEADERS};
    if (auth) {
      headers[HttpHeaders.authorizationHeader] = "Bearer $value";
    }

    final response = await http.get(
      Uri.parse("$baseUrl$url"),
      headers: headers,
    );
    ApiError.checkResponse(response.statusCode);
    return response;
  }

  Future<http.Response> post(
    String url,
    Map body, {
    bool auth = false,
    baseUrl = BASE_URL,
  }) async {
    Map<String, String> headers = {...HEADERS};
    String? value = storage.getString("token");
    if (auth) {
      headers[HttpHeaders.authorizationHeader] = "Bearer $value";
    }
    final response = await http.post(
      Uri.parse("$baseUrl$url"),
      body: json.encode(body),
      headers: headers,
    );
    ApiError.checkResponse(response.statusCode);
    return response;
  }

  Future<http.Response> put(
    String url,
    Map body, {
    bool auth = false,
    baseUrl = BASE_URL,
  }) async {
    Map<String, String> headers = {...HEADERS};
    String? value = storage.getString("token");
    if (auth) {
      headers[HttpHeaders.authorizationHeader] = "Bearer $value";
    }
    final response = await http.put(
      Uri.parse("$baseUrl$url"),
      body: json.encode(body),
      headers: headers,
    );
    ApiError.checkResponse(response.statusCode);
    return response;
  }

  Future<http.Response> delete(
    String url, {
    bool auth = false,
    baseUrl = BASE_URL,
  }) async {
    Map<String, String> headers = {...HEADERS};
    String? value = storage.getString("token");
    if (auth) {
      headers[HttpHeaders.authorizationHeader] = "Bearer $value";
    }
    final response = await http.delete(
      Uri.parse("$baseUrl$url"),
      headers: headers,
    );
    ApiError.checkResponse(response.statusCode);
    return response;
  }
}
