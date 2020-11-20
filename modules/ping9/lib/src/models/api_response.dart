import 'dart:async';
import 'dart:core';

class ApiResponse<T> {

  StreamController onStatusChanged;

  String message;

  T _data;

  T get data => _data;

  ApiStatus _status;

  ApiStatus get status => _status;

  set status(ApiStatus value) {
    _status = value;
    onStatusChanged.add(_status);
  }

  bool get isLoading => _status == ApiStatus.loading;

  bool get isCompleted => _status == ApiStatus.success;

  bool get isError => _status == ApiStatus.error;

  set loading(String message) {
    this.message = message;
    status = ApiStatus.loading;
  }

  set completed(T data) {
    this._data = data;
    this.message = '';
    status = ApiStatus.success;
  }

  set error(String message) {
    this.message = message;
    _data = null;
    status = ApiStatus.error;
  }

  final bool requiredStore;
  final bool requiredLanguage;

  ApiResponse({this.requiredStore = true, this.requiredLanguage = true}) {
    message = 'Not load yet';
    _status = ApiStatus.none;
    _data = null;
    onStatusChanged = StreamController<ApiStatus>.broadcast();
  }

  bool isLoadFinish() {
    return this._status == ApiStatus.success;
  }
}

enum ApiStatus {none, loading, error, success }