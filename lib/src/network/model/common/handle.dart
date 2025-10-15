import 'dart:core';

import 'result.dart';
part 'status.dart';

class MHandle<T> {
  MHandle.result(MResult<T> result) {
    message = result.error;
    _data = result.data;
    _status = result.isError ? MStatus.failure : MStatus.success;
  }

  MHandle.error(this.message) {
    _data = null;
    _status = MStatus.failure;
  }

  MHandle.completed(T data) {
    _data = data;
    message = '';
    _status = MStatus.success;
  }
  MHandle.loading({this.message}) {
    _status = MStatus.loading;
  }

  MHandle() {
    _status = MStatus.initial;
  }
  String? message;

  T? _data;

  T? get data => _data;

  MStatus _status = MStatus.initial;

  bool get isLoading => _status == MStatus.loading;

  bool get isCompleted => _status == MStatus.success;

  bool get isError => _status == MStatus.failure;
}
