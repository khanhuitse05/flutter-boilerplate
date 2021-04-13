import 'package:flutter/material.dart';
import 'package:stack_trace/stack_trace.dart';

bool isNullOrEmpty(Object? object) {
  if (object == null) {
    return true;
  }
  if (object is String) {
    return object.trim().isEmpty;
  }
  if (object is Iterable) {
    return object.isEmpty;
  }
  if (object is Map) {
    return object.isEmpty;
  }
  return false;
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void printTrace(Object? object, {int frames = 1}) {
  final output = "${Trace.current().frames[frames].location} | $object";
  final pattern = RegExp('.{1,1000}');
  pattern.allMatches(output).forEach((match) => debugPrint(match.group(0)));
}
