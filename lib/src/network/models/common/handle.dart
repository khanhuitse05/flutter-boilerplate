import 'dart:core';
import 'result.dart';

class XHandle<T> {
  String? message;

  T? _data;

  T? get data => _data;

  Status _status = Status.none;

  bool get isLoading => _status == Status.loading;

  bool get isCompleted => _status == Status.success;

  bool get isError => _status == Status.error;

  XHandle() {
    _status = Status.none;
  }
  XHandle.loading({this.message}) {
    _status = Status.loading;
  }

  XHandle.completed(T data) {
    this._data = data;
    this.message = '';
    _status = Status.success;
  }

  XHandle.error(this.message) {
    _data = null;
    _status = Status.error;
  }

  XHandle.result(XResult<T> result) {
    this.message = result.error;
    _data = result.data;
    _status = result.isError ? Status.error : Status.success;
  }
}

enum Status { none, loading, error, success }
