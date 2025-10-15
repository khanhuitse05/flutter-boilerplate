import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myapp/src/services/user_prefs.dart';

enum XMethod {
  get,
  post,
  put,
  patch,
  delete,
  head;
}

class XHttp {
  factory XHttp() => instance;
  XHttp._internal();

  static final XHttp instance = XHttp._internal();
  static XHttp get I => instance;

  String? tokenApi;
  final Logger _log = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // Number of method calls to be displayed
      // Should each log print contain a timestamp
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  String baseUrl = 'http://13.251.254.214:8000/';

  final int _defaultSecondTimeout = 15;

  Map<String, String> get _headers => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  /// Configure Dio
  Dio _configDio({bool ignoreToken = false, int? timeout, String? token}) {
    final durationTimeout = Duration(seconds: timeout ?? _defaultSecondTimeout);
    final String? tokenValue = ignoreToken ? null : token ?? tokenApi;
    final headers = {
      ..._headers,
      if (tokenValue?.isNotEmpty == true) "Authorization": "Bearer $tokenValue",
    };
    final option = BaseOptions(
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: durationTimeout,
      receiveTimeout: durationTimeout,
      sendTimeout: durationTimeout,
    );
    return Dio(option);
  }

  void removeTokenApi() {
    UserPrefs.I.setToken(null);
    tokenApi = '';
  }

  void setTokenApi(String token) {
    UserPrefs.I.setToken(token);
    // ignore: avoid_print
    print('setTokenApi: $token');
    tokenApi = token;
  }

  Future<Response> request(
    XMethod method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    Options? options,
    bool ignoreToken = false,
    int attemptFailed = 0,
    int? timeout,
    String? token,
  }) async {
    Object? bodyResponse;
    try {
      final Response response = await _configDio(
              ignoreToken: ignoreToken, timeout: timeout, token: token)
          .request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: _checkOptions(method.name, options),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );
      bodyResponse = response.data;
      _log.i('> RESPONSE Status< [${response.statusCode}]<  $url');
      _log.i('> RESPONSE Body< ${response.data.toString()}');
      return response;
    } on DioException catch (e) {
      _log.e('> API CATCH Error< $e');
      _log.e('> API CATCH Body< $bodyResponse');
      rethrow;
    } catch (e) {
      _log.e('> API CATCH Error< $e');
      _log.e('> API CATCH Body< $bodyResponse');
      rethrow;
    }
  }

  Options _checkOptions(String? method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  // NOTE: Example simple GET/POST, You can customize it according to your project's.
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.get,
      url,
      queryParameters: queryParameters,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  Future<Response> post(
    String url, {
    Object? data,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.post,
      url,
      data: data,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  Future<Response> put(
    String url, {
    Object? data,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.put,
      url,
      data: data,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  Future<Response> patch(
    String url, {
    Object? data,
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.patch,
      url,
      data: data,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  Future<Response> delete(
    String url, {
    bool ignoreToken = false,
    int? timeout,
    String? token,
  }) {
    return request(
      XMethod.delete,
      url,
      ignoreToken: ignoreToken,
      timeout: timeout,
      token: token,
    );
  }

  Future<bool> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult.contains(ConnectivityResult.none);
  }
}
