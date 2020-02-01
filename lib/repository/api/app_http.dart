import 'dart:io';
import 'package:http/http.dart' as http;

class AppHttp {

  final Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  Future<http.Response> get(String url,
      {Map<String, String> headers}) async {
    if (headers != null && headers.isNotEmpty) {
      headers.addAll(_headers);
    } else {
      headers = _headers;
    }

    try {
      print('> API GET <');
      print(url);
      final response =
          await http.get(url, headers: headers).timeout(Duration(seconds: 10));
      print('> API RESPONSE <');
      print(response.statusCode);
      print(response.body);
      return response;
    } catch (e) {
      print('> API CATCH <');
      print(e.toString());
      throw (e);
    }
    throw ('Some thing went wrong');
  }

  post(String url, {var body, Map<String, String> headers}) async {
    if (headers != null && headers.isNotEmpty) {
      headers.addAll(_headers);
    } else {
      headers = _headers;
    }
    try {
      print('> API POST <');
      print(url);
      print(body);
      final response = await http
          .post(url, body: body, headers: headers)
          .timeout(Duration(seconds: 10));
      print('> API RESPONSE <');
      print(response.statusCode);
      print(response.body);
      return response;
    } catch (e) {
      print('> API CATCH <');
      print(e.toString());
      throw (e);
    }
    throw ('Some thing went wrong');
  }
}
