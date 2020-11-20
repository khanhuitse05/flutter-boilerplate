import 'package:flutter/services.dart';
import 'package:ping9/src/utility/utility.dart';

class Result<T> {
  T data;
  String error;

  bool get isError => isNullOrEmpty(error) == false;

  Result.success(this.data) {
    this.error = null;
  }

  Result.error(this.error) {
    this.data = null;
    printTrace(error);
  }

  Result.exception(e, {String defaultError}) {
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message;
    } else {
      error = defaultError ?? e.toString();
    }
    printTrace("${e.runtimeType}: $e");
    this.data = null;
  }
}
