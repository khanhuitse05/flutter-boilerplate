import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:my_app/src/localization/localization_utils.dart';

class XHttp {
  static String? tokenType;
  static String? tokenApi;

  static Map<String, String> get _headers => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$tokenType $tokenApi"
      };

  static void setTokenApi(String tokenApi, {String tokenType = "Bearer"}) {
    XHttp.tokenType = tokenType;
    XHttp.tokenApi = tokenApi;
  }

  static const domain = '';
  static Logger _log = Logger();

  static Future<String> get(String url) async {
    String bodyResponse = '';
    try {
      final uri = Uri.https(domain, url);
      final response = await http
          .get(uri, headers: _headers)
          .timeout(const Duration(minutes: 5));
      _log.i('> GET RESPONSE [${response.statusCode}]<  $url');
      bodyResponse = response.body;
      if (response.statusCode <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode >= 400) {
          throw FlutterError(S.text.error_noInternet);
        } else {
          throw FlutterError(S.text.error_unknown);
        }
      }
    } catch (e) {
      _log.w('> API CATCH Error< $e');
      _log.w('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }

  static Future<String> post(String url, {String? body}) async {
    String bodyResponse = '';
    try {
      final uri = Uri.https(domain, url);
      final response = await http
          .post(uri, body: body, headers: _headers)
          .timeout(const Duration(minutes: 5));
      _log.i('> POST RESPONSE [${response.statusCode}]< $url $body');
      bodyResponse = response.body;
      if (response.statusCode <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode >= 400) {
          throw FlutterError(S.text.error_noInternet);
        } else {
          throw FlutterError(S.text.error_unknown);
        }
      }
    } catch (e) {
      _log.w('> API CATCH Error< $e');
      _log.w('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }
}
