import 'package:flutter/services.dart';

class XResult<T> {
  T? data;
  String? error;

  bool get isError => error != null;
  bool get isSuccess => error == null && data != null;

  XResult.success(this.data) {
    this.error = null;
  }

  XResult.error(String? error) {
    this.data = null;
    this.error = error ?? 'An Unknown Error Occurred';
  }

  XResult.exception(Object? e) {
    this.data = null;
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message?.toString();
    }
    error ??= 'An Unknown Error Occurred';
  }
}
