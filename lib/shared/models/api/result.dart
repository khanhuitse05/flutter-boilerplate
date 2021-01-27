import 'package:flutter/services.dart';
import 'package:my_app/core/content/message.dart';
import 'package:ping9/ping9.dart';

class Result<T> {
  T data;
  String error;

  bool get isError => isNullOrEmpty(error) == false;

  Result.success(this.data) {
    this.error = null;
  }

  Result.error(this.error) {
    this.data = null;
    error ??= Message.errorUnknown;
    printTrace(error, frames: 2);
  }

  Result.exception(e) {
    this.data = null;
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message;
    } else {
      error = Message.errorUnknown ?? e.toString();
    }
    printTrace("${e.runtimeType}: $e", frames: 2);
  }
}
