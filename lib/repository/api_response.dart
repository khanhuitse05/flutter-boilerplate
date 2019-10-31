import 'dart:async';
import 'dart:convert';
import 'dart:core';

class ApiResponse<T> {

  StreamController onStatusChanged;

  //String language;
  String message;

  T _data;

  T get data => _data;

  Status _status;

  Status get status => _status;

  set status(Status value) {
    _status = value;
    onStatusChanged.add(_status);
  }

  bool get isLoading => _status == Status.loading;

  bool get isCompleted => _status == Status.success;

  bool get isError => _status == Status.error;

  set loading(String message) {
    this.message = message;
    status = Status.loading;
  }

  set completed(T data) {
    this._data = data;
    this.message = '';

    //this.language = GlobalConfig.currentLanguage;
    status = Status.success;
  }

  set error(String message) {
    this.message = message;
    _data = null;
    status = Status.error;
  }

  final bool requiredStore;
  final bool requiredLanguage;

  ApiResponse({this.requiredStore = true, this.requiredLanguage = true}) {
    //language = '';
    message = 'Not load yet';
    _status = Status.error;
    _data = null;
    onStatusChanged = StreamController<Status>.broadcast();
  }

  bool isLoadFinish() {
    return (
        //(requiredLanguage == false || this.language == GlobalConfig.currentLanguage) &&
        this._status == Status.success);
  }

  static bool isSuccess(String body) {
    try {
      var message = json.decode(body);
      return message['status'] == 'success';
    } catch (e) {
      return false;
    }
  }

  static String getMessage(String body) {
    try {
      var message = json.decode(body);
      return message['message'];
    } catch (e) {
      return '';
    }
  }
}

enum Status { loading, error, success }