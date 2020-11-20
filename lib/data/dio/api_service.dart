import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'api_client_gen.dart';

class ApiService {
  // constant
  static const String apiDomain = "https://mydomain.com/api/v1/";

  final Dio dio = Dio();
  ApiClient client;

  ApiServiceHandler handlerError;

  void create() {
    client = ApiClient(dio, baseUrl: apiDomain);

    addDioHeader();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          printLog(
              '''[api-${DateFormat('mm:ss').format(DateTime.now())}]-> Request  \t${options.method} [${options.path}]}''');

          return options; //continue
        },
        onResponse: (Response response) {
          printLog(
              '''[api-${DateFormat('mm:ss').format(DateTime.now())}]-> Response \t${response.request.method} [${response.request.path}] ${response.statusCode} ''');

          return response; // continue
        },
        onError: (DioError error) async {
          printLog(
              '''[api-${DateFormat('mm:ss').format(DateTime.now())}]-> Error    \turl:[${error.request.baseUrl}${error.request.path}] type:${error.type} message: ${error.message}''');
          return handleError(error);
        },
      ),
    );
  }

  void addDioHeader({Map<String, String> headers}) {
    dio.options.headers.clear();
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;

    // final String token = getToken();
    // if (isNullOrEmpty(token) ?? false) {
    //   dio.options.headers[K.authorization] = 'Bearer $token';
    // }

    headers?.forEach((k, v) {
      dio.options.headers[k] = v;
    });
  }

  dynamic handleError(DioError error) {
    if (handlerError == null) {
      return error;
    }

    final result = ApiServerErrorData(
      type: ApiServerErrorType.unKnow,
      message: error.message,
    );

    switch (error.type) {
      case DioErrorType.RECEIVE_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.CONNECT_TIMEOUT:
        result.type = ApiServerErrorType.timeout;
        break;
      case DioErrorType.RESPONSE:
        {
          printLog(
              '''[api] _handleError DioErrorType.RESPONSE status code: ${error.response.statusCode}''');
          result.statusCode = error.response.statusCode;

          if (result.statusCode == 401) {
            result.type = ApiServerErrorType.unAuthorized;
          }
          if (result.statusCode == 403) {
          } else if (result.statusCode >= 500 && result.statusCode < 600) {
            result.type = ApiServerErrorType.httpException;
          } else {
            result.type = ApiServerErrorType.httpException;
            // result.message = getErrorMessage(error.response.data);
          }
          break;
        }
      case DioErrorType.CANCEL:
        break;
      case DioErrorType.DEFAULT:
        printLog(
            '''[api] _handleError DioErrorType.DEFAULT status code: error.response is null -> Server die or No Internet connection''');
        result.type = ApiServerErrorType.noInternet;

        if (error.message.contains('Unexpected character')) {
          result.type = ApiServerErrorType.serverExpected;
        }
        break;
    }

    return handlerError.onError(result); //continue
  }

  String getErrorMessage(Map<String, dynamic> dataRes) {
    if (dataRes.containsKey('message') && dataRes['message'] != null) {
      return dataRes['message']?.toString();
    }
    if (dataRes.containsKey('error') && dataRes['error'] != null) {
      return dataRes['error']?.toString();
    }
    return dataRes.toString();
  }

  void printLog(Object data) {
    debugPrint('[LOG]' '${data.toString()}');
  }
}

enum ApiServerErrorType {
  noInternet,
  httpException,
  timeout,
  unAuthorized,
  unKnow,
  serverExpected
}

class ApiServerErrorData {
  ApiServerErrorType type;
  String message;
  int statusCode;

  ApiServerErrorData({this.type, this.statusCode, this.message});
}

// ignore: one_member_abstracts
abstract class ApiServiceHandler {
  void onError(ApiServerErrorData onError);
}
