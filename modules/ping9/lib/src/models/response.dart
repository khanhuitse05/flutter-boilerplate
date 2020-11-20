import 'dart:core';

class ApiResponse<T> {
  ApiResponse();

  String message;

  T _data;

  T get data => _data;

  ApiStatus _status;

  ApiStatus status = ApiStatus.none;

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
}

enum ApiStatus { none, loading, error, success }
