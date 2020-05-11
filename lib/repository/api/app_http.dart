import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/core/storage_manager.dart';
import 'package:stack_trace/stack_trace.dart';

// ignore: avoid_classes_with_only_static_members
class AppHttp {
  static Map<String, String> get _headers => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $tokenApi"
      };
  static const _kKeyStorageToken = 'keyToken';
  static String _tokenApi;

  static Future<String> loadToken() async {
    return _tokenApi =
        await StorageManager.instance.getObjectByKey(_kKeyStorageToken);
  }

  static String get tokenApi => _tokenApi;

  static set tokenApi(String tokenApi) {
    _tokenApi = tokenApi;
    StorageManager.instance.setObject(_kKeyStorageToken, tokenApi);
  }

  static const domain = 'http://api.black-cloud.xyz/api';

  static Future<http.Response> get(String url) async {
    try {
      final response = await http
          .get(domain + url, headers: _headers)
          .timeout(const Duration(seconds: 10));
      debugPrint(_headers.toString());
      debugPrint('> GET RESPONSE <  $domain$url');
      log(response.body);
      return response;
    } catch (e) {
      debugPrint('> API CATCH <');
      debugPrint(e.toString());
      rethrow;
    }
  }

  //json.encode body first
  static Future<http.Response> post(String url, {String body}) async {
    try {
      final response = await http
          .post(domain + url, body: body, headers: _headers)
          .timeout(const Duration(seconds: 10));
      debugPrint('> POST RESPONSE < $domain$url');
      log(body);
      log(response.body);
      return response;
    } catch (e) {
      debugPrint('> API CATCH <');
      debugPrint(e.toString());
      rethrow;
    }
  }

  static log(Object object) {
    final output = "${Trace.current().frames[2].location} | $object";
    final pattern = RegExp('.{1,1000}');
    pattern.allMatches(output).forEach((match) => debugPrint(match.group(0)));
  }
}
