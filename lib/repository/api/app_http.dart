import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppHttp {
  final Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  Future<http.Response> get(String url) async {
    try {
      final response =
          await http.get(url, headers: _headers).timeout(Duration(seconds: 10));
      debugPrint('> API GET < $url');
      debugPrint(response.body, wrapWidth: 1024);
      return response;
    } catch (e) {
      debugPrint('> API CATCH < $e');
      throw (e);
    }
  }

  post(String url, {var body}) async {
    try {
      final response = await http
          .post(url, body: body, headers: _headers)
          .timeout(Duration(seconds: 10));
      debugPrint('> API POST < $url');
      debugPrint(body.toString());
      debugPrint(response.body, wrapWidth: 1024);
      return response;
    } catch (e) {
      print('> API CATCH < $e');
      throw (e);
    }
  }
}
