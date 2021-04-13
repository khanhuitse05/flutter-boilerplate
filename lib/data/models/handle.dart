import 'dart:core';

import 'package:my_app/data/models/result.dart';

class Handle<T> {
  String? message;

  T? _data;

  T? get data => _data;

  Status _status = Status.none;

  bool get isLoading => _status == Status.loading;

  bool get isCompleted => _status == Status.success;

  bool get isError => _status == Status.error;

  set loading(String message) {
    this.message = message;
    _status = Status.loading;
  }

  set completed(T data) {
    this._data = data;
    this.message = '';
    _status = Status.success;
  }

  set error(String message) {
    this.message = message;
    _data = null;
    _status = Status.error;
  }

  set result(Result<T> result) {
    this.message = result.error;
    _data = result.data;
    _status = result.isError ? Status.error : Status.success;
  }
}

enum Status { none, loading, error, success }
