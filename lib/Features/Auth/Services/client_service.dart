// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;

import '../../../Constants/global_variables.dart';

class ClientService {
  Map<String, String> header = {
    "Content-Type": "application/json; charset=UTF-8",
  };

  Future<http.Response> get(
      {required String url, dynamic body, String? token}) {
    if (token != null) header['x-auth-token'] = token;
    return http.get(
      Uri.parse(uri + url),
      headers: header,
    );
  }

  Future<http.Response> post(
      {required String url, required dynamic body, String? token}) {
    if (token != null) header['x-auth-token'] = token;
    return http.post(
      Uri.parse(uri + url),
      body: body,
      headers: header,
    );
  }
}
