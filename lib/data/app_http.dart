import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/src/content/message.dart';
import 'package:stack_trace/stack_trace.dart';

class AppHttp {
  static String? tokenType;
  static String? tokenApi;

  static Map<String, String> get _headers => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "$tokenType $tokenApi"
      };

  static void setTokenApi(String tokenApi, {String tokenType = "Bearer"}) {
    AppHttp.tokenType = tokenType;
    AppHttp.tokenApi = tokenApi;
  }

  static const domain = '';

  static Future<String> get(String url) async {
    String bodyResponse = '';
    try {
      final uri = Uri.https(domain, url);
      final response = await http
          .get(uri, headers: _headers)
          .timeout(const Duration(minutes: 5));
      log('> GET RESPONSE [${response.statusCode}]<  $url');
      bodyResponse = response.body;
      if (response.statusCode <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode >= 400) {
          throw FlutterError(Message.errorInternet);
        } else {
          throw FlutterError(Message.errorUnknown);
        }
      }
    } catch (e) {
      log('> API CATCH Error< $e');
      log('> API CATCH Body< $bodyResponse');
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
      log('> POST RESPONSE [${response.statusCode}]< $url $body');
      bodyResponse = response.body;
      if (response.statusCode <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode >= 400) {
          throw FlutterError(Message.errorInternet);
        } else {
          throw FlutterError(Message.errorUnknown);
        }
      }
    } catch (e) {
      log('> API CATCH Error< $e');
      log('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }

  static Future<String> put(String url, {String? body}) async {
    String bodyResponse = '';
    try {
      final uri = Uri.https(domain, url);
      final response = await http
          .put(uri, body: body, headers: _headers)
          .timeout(const Duration(minutes: 5));
      log('> PUT RESPONSE [${response.statusCode}]< $url');
      bodyResponse = response.body;
      if (response.statusCode <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode >= 400) {
          throw FlutterError(Message.errorInternet);
        } else {
          throw FlutterError(Message.errorUnknown);
        }
      }
    } catch (e) {
      log('> API CATCH Error< $e');
      log('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }

  static Future<String> patch(String url, {String? body}) async {
    String bodyResponse = '';
    try {
      final uri = Uri.https(domain, url);
      final response = await http
          .patch(uri, body: body, headers: _headers)
          .timeout(const Duration(minutes: 5));
      log('> PATCH RESPONSE [${response.statusCode}]< $url');
      bodyResponse = response.body;
      if (response.statusCode <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode >= 400) {
          throw FlutterError(Message.errorInternet);
        } else {
          throw FlutterError(Message.errorUnknown);
        }
      }
    } catch (e) {
      log('> API CATCH Error< $e');
      log('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }

  static Future<String> delete(String url) async {
    String bodyResponse = '';
    try {
      final uri = Uri.https(domain, url);
      final response = await http
          .delete(uri, headers: _headers)
          .timeout(const Duration(minutes: 5));
      log('> DELETE RESPONSE [${response.statusCode}]< $url');
      bodyResponse = response.body;
      if (response.statusCode <= 299) {
        return bodyResponse;
      } else {
        if (response.statusCode >= 400) {
          throw FlutterError(Message.errorInternet);
        } else {
          throw FlutterError(Message.errorUnknown);
        }
      }
    } catch (e) {
      log('> API CATCH Error< $e');
      log('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }

  static void log(Object object) {
    final output = "${Trace.current().frames[2].location} | $object";
    final pattern = RegExp('.{1,1000}');
    pattern.allMatches(output).forEach((match) => debugPrint(match.group(0)));
  }
}
