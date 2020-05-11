
import 'package:my_app/core/utility.dart';

const kErrorMessage = 'Oops, Something went wrong, try again...';

class ApiResult {
  String status;
  String _message;

  String get message {
    if (_message == 'Expectation failed') {
      final Map _fields = data['requiredFields'];
      if (isNullOrEmpty(_fields) == false) {
        final String _first = _fields.keys.first;
        return _requestMessage[_first] ?? _fields[_first]['message'] ?? _first;
      }
    }
    return _errorMessage[_message] ?? _message ?? kErrorMessage;
  }

  set message(String message) {
    _message = message;
  }

  dynamic data;

  bool get isSuccess => status == 'success';

  bool get unauthenticated => _message == 'Unauthenticated';

  ApiResult();

  ApiResult.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        _message = map["message"],
        data = map["data"];

  ApiResult.defaultError()
      : status = 'error',
        _message = kErrorMessage,
        data = null;
}

Map _requestMessage = {
  'email': 'Invalid E-mail',
  'phone': 'Invalid phone number',
  // so on
};
Map _errorMessage = {
  'otp_not_found': "Invalid OTP",
  'Unauthenticated': kErrorMessage,
};
