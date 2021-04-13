import 'package:flutter/services.dart';
import 'package:my_app/src/content/message.dart';
import 'package:my_app/src/utils/index.dart';

class Result<T> {
  T? data;
  String? error;

  bool get isError => isNullOrEmpty(error) == false;

  Result.success(this.data) {
    this.error = null;
  }

  Result.error(this.error) {
    this.data = null;
    error ??= Message.errorUnknown;
    printTrace(error, frames: 2);
  }

  Result.exception(Object? e) {
    this.data = null;
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message?.toString();
    } else {
      error = Message.errorUnknown;
    }
    printTrace("${e.runtimeType}: $e", frames: 2);
  }
}
